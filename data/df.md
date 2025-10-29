# df

Disk free - shows available disk space.

## Examples
- `df -h → Show space in GB/MB`
- `df -h /home → Check specific mount`
- `df -i → Show inode usage`
- `df -h | grep -v tmpfs → Hide temp filesystems`

## Pro tip
Use 'df -h | grep -v tmpfs' to hide temporary filesystems!

