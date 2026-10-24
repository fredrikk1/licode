# systemctl

Control systemd services - start, stop, enable and inspect them.

## Examples
- `systemctl status nginx → Service status`
- `sudo systemctl restart nginx → Restart a service`
- `sudo systemctl enable --now nginx → Start now and on boot`
- `systemctl list-units --type=service → List services`

## Pro tip
'systemctl --failed' instantly shows which services are broken!

