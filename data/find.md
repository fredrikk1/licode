# find

Search for files and directories - finds files by name, size, date, etc.

## Examples
- `find . -name '*.txt' → Find all .txt files`
- `find /var/log -mtime -7 → Files modified last 7 days`
- `find . -type f -size +10M → Files larger than 10MB`
- `find . -name '*.tmp' -delete → Find and delete`

## Pro tip
Use 'find . -name "*.tmp" -delete' to find and delete in one command!

