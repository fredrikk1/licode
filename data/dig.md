# dig

DNS lookup - asks DNS servers about domains and records.

## Examples
- `dig example.com → Full DNS answer`
- `dig +short example.com → Just the IP`
- `dig MX example.com → Mail servers`
- `dig @1.1.1.1 example.com → Ask a specific DNS server`

## Pro tip
Use 'dig +short' for just the answer, perfect in scripts!

