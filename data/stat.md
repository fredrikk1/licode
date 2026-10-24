# stat

Show detailed file info - size, permissions, owner and timestamps.

## Examples
- `stat file.txt → All file details`
- `stat -c %s file.txt → Size in bytes`
- `stat -c %a file.txt → Numeric permissions`
- `stat -c %y file.txt → Last modification time`

## Pro tip
'stat -c %a file' prints permissions as a number like 644!

