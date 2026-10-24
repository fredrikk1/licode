# chmod

Change file permissions - controls who can read/write/execute files.

## Examples
- `chmod 755 script.sh → Make executable for all`
- `chmod u+x file.sh → Add execute for owner`
- `chmod -R a+rX folder/ → Make folder readable recursively`
- `chmod go-w file.txt → Remove write for group/others`

## Pro tip
755 = rwxr-xr-x. Use 'chmod +x script.sh' for executables!

