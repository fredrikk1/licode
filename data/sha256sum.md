# sha256sum

Checksums - compute or verify SHA-256 hashes to check file integrity.

## Examples
- `sha256sum file.iso → Show checksum`
- `sha256sum -c SHA256SUMS → Verify against a list`
- `sha256sum *.tar.gz > sums.txt → Save checksums`
- `echo -n text | sha256sum → Hash a string`

## Pro tip
Always verify downloaded ISOs with 'sha256sum -c' before installing!

