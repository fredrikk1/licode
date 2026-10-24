# tr

Translate characters - replace, squeeze or delete characters in a stream.

## Examples
- `echo hello | tr a-z A-Z → Convert to uppercase`
- `tr '[:upper:]' '[:lower:]' < in.txt → Convert to lowercase`
- `tr -s ' ' < file.txt → Squeeze repeated spaces`
- `echo 'a,b,c' | tr , ' ' → Commas to spaces`

## Pro tip
Squeeze repeated spaces with tr -s before splitting columns with cut!

