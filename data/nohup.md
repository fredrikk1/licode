# nohup

Ignore hangups - keep a command running after you log out.

## Examples
- `nohup ./script.sh & → Run in background, immune to logout`
- `nohup cmd > out.log 2>&1 & → Choose the log file`
- `tail -f nohup.out → Watch default output`

## Pro tip
For anything long-running, tmux or screen is usually nicer!

