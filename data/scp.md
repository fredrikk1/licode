# scp

Secure copy - transfer files between computers over SSH.

## Examples
- `scp file.txt user@server:/path/ → Upload file`
- `scp -r folder/ user@server:~/ → Upload folder`
- `scp user@server:/file.txt . → Download file`
- `scp -P 2222 file.txt user@server:~/ → Custom port`

## Pro tip
Use capital -P for port: 'scp -P 2222' (different from ssh -p)!

