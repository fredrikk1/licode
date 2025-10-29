#!/usr/bin/env bash
# collect_en.sh - Generate JSON from markdown files

DATA_DIR="data"
OUTPUT="commands_en.json"

# Check data dir
[ ! -d "$DATA_DIR" ] && { echo "No $DATA_DIR/ found. Run ./create_commands.sh first."; exit 1; }

# Use Python for proper JSON generation
python3 << 'PYTHON'
import json
import re
import os
from pathlib import Path

data_dir = Path("data")
commands = []

for md_file in sorted(data_dir.glob("*.md")):
    content = md_file.read_text()
    name = md_file.stem
    
    # Extract description
    lines = content.split('\n')
    desc_lines = []
    in_desc = False
    for line in lines:
        if line.startswith('# '):
            in_desc = True
            continue
        if line.startswith('## Examples'):
            break
        if in_desc and line.strip():
            desc_lines.append(line.strip())
    
    description = ' '.join(desc_lines) if desc_lines else f"Run {name} to perform its function."
    
    # Extract examples
    examples = []
    for line in lines:
        match = re.search(r'`([^`]+)`', line)
        if match:
            full = match.group(1)
            # Split on →
            if ' → ' in full:
                cmd_part, desc_part = full.split(' → ', 1)
                examples.append({"cmd": cmd_part.strip(), "desc": desc_part.strip()})
            else:
                examples.append({"cmd": full.strip()})
    
    # Extract pro tip
    protip_lines = []
    in_protip = False
    for line in lines:
        if line.startswith('## Pro tip'):
            in_protip = True
            continue
        if in_protip and line.startswith('##'):
            break
        if in_protip and line.strip():
            protip_lines.append(line.strip())
    
    protip = ' '.join(protip_lines) if protip_lines else "A useful Linux command!"
    
    commands.append({
        "name": name,
        "description": description,
        "examples": examples if examples else [{"cmd": f"Example: {name}"}],
        "protip": protip
    })

# Write JSON
with open("commands_en.json", "w") as f:
    json.dump(commands, f, indent=2, ensure_ascii=False)

print(f"commands_en.json updated with {len(commands)} VALID commands!")
PYTHON

