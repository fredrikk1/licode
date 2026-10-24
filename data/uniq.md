# uniq

Filter repeated lines - removes or counts adjacent duplicates.

## Examples
- `sort list.txt | uniq → Remove duplicate lines`
- `sort list.txt | uniq -c → Count occurrences`
- `sort list.txt | uniq -d → Show only duplicates`
- `sort list.txt | uniq -u → Lines that appear once`

## Pro tip
uniq only sees neighbours - always 'sort' first!

