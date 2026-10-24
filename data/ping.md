# ping

Test network reachability - sends packets and measures the round-trip time.

## Examples
- `ping google.com → Ping until Ctrl+C`
- `ping -c 4 1.1.1.1 → Send exactly 4 packets`
- `ping -i 0.5 example.com → Ping every half second`
- `ping -W 2 example.com → Wait max 2 seconds for reply`

## Pro tip
Use 'ping -c 4' so it stops by itself instead of running forever!

