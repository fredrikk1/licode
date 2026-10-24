# nice

CPU priority - run commands with lower (or higher) priority.

## Examples
- `nice -n 19 tar czf backup.tgz /home → Lowest priority`
- `sudo nice -n -5 cmd → Higher priority (needs root)`
- `renice 10 -p 1234 → Change a running process`

## Pro tip
Prefix heavy jobs with 'nice -n 19' so your desktop stays responsive!

