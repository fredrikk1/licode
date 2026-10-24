# tee

Split output - shows output on screen and saves it to a file at the same time.

## Examples
- `ls | tee files.txt → Show and save output`
- `make 2>&1 | tee build.log → Log a build while watching it`
- `echo hi | tee -a log.txt → Append instead of overwrite`
- `echo 'x' | sudo tee /etc/myapp.conf → Write a root-owned file`

## Pro tip
Use 'echo line | sudo tee -a /etc/file' to append to root-owned files!

