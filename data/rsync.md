# rsync

Remote sync - efficiently sync files by copying only differences.

## Examples
- `rsync -avz source/ dest/ → Sync folders`
- `rsync -avz --delete src/ backup/ → Perfect mirror`
- `rsync -avz -e ssh folder/ user@server:~/ → Sync via SSH`

## Pro tip
Add '--dry-run' to preview changes before committing!

