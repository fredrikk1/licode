# awk

Text processing - extracts and manipulates columns of data.

## Examples
- `awk '{print $1}' file.txt → Print first column`
- `awk -F: '{print $1}' /etc/passwd → Extract usernames`
- `awk 'NR>1 {sum+=$3} END {print sum}' data.txt → Sum column 3`

## Pro tip
Use '-F,' for comma-separated files and 'NR>1' to skip the header line!

