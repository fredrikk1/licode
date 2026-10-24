# journalctl

System logs - read everything collected by systemd.

## Examples
- `journalctl -u nginx → Logs for one service`
- `journalctl -f → Follow new log lines`
- `journalctl --since '1 hour ago' → Time filter`
- `journalctl -b -p err → Errors from this boot`

## Pro tip
Use 'journalctl -u name -f' to follow one service's log live!

