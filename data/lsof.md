# lsof

List open files - see which process uses a file, folder or port.

## Examples
- `sudo lsof -i :80 → What uses port 80`
- `sudo lsof -u alice → Files opened by a user`
- `lsof +D /var/log → Who uses files in a folder`
- `lsof -p 1234 → Files opened by a process`

## Pro tip
'sudo lsof -i :8080' finds what is blocking your port!

