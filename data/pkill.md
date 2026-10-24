# pkill

Kill by name - stop processes without looking up the PID.

## Examples
- `pkill firefox → Stop processes by name`
- `pgrep -a node → Find matching processes first`
- `pkill -f 'python app.py' → Match the full command line`
- `pkill -9 hung-app → Force kill (last resort)`

## Pro tip
Run 'pgrep -a name' first to see what would be killed!

