# basename

Strip the path - leaves just the file name, optionally without suffix.

## Examples
- `basename /var/log/syslog → File name only`
- `basename photo.jpg .jpg → Remove the suffix too`
- `dirname /var/log/syslog → Folder part only`
- `realpath file.txt → Full absolute path`

## Pro tip
Great in loops: 'for f in *.png; do echo "$(basename "$f" .png)"; done'!

