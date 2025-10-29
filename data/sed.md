# sed

Stream editor - edits text without opening files.

## Examples
- `sed 's/old/new/g' file.txt → Replace all occurrences`
- `sed -i 's/foo/bar/g' *.txt → Replace in-place`
- `sed -n '10,20p' file.txt → Print lines 10-20`
- `sed '/pattern/d' file.txt → Delete matching lines`

## Pro tip
Test without '-i' first to see changes before saving!

