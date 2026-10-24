# cut

Cut out columns - extract fields or characters from each line.

## Examples
- `cut -d, -f1 data.csv → First column of a CSV`
- `cut -d: -f1,7 /etc/passwd → Users and their shells`
- `cut -c1-10 file.txt → First 10 characters per line`
- `cut -f2 data.tsv → Second tab-separated field`

## Pro tip
Use 'cut -d: -f1 /etc/passwd' to list every user on the system!

