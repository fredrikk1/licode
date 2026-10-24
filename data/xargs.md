# xargs

Build commands from input - turns lines of input into arguments.

## Examples
- `find . -name '*.log' -print0 | xargs -0 rm → Delete found files`
- `find . -name '*.txt' -print0 | xargs -0 wc -l → Count lines in found files`
- `cat urls.txt | xargs -n1 curl -O → Download each URL`
- `echo a b c | xargs -n1 → One argument per line`

## Pro tip
Use 'find ... -print0 | xargs -0' so filenames with spaces work!

