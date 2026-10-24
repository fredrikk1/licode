# ss

Socket statistics - shows open ports and connections (modern netstat).

## Examples
- `sudo ss -tulpn → Listening TCP/UDP ports with programs`
- `ss -t → Active TCP connections`
- `ss -s → Summary statistics`
- `ss -lt 'sport = :22' → Who listens on port 22`

## Pro tip
'sudo ss -tulpn' shows which program listens on which port!

