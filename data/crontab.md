# crontab

Schedule recurring jobs - run commands automatically at set times.

## Examples
- `crontab -e → Edit your scheduled jobs`
- `crontab -l → List your jobs`
- `0 3 * * * /path/to/backup.sh → Line: every night at 03:00`
- `*/5 * * * * /path/to/cmd → Line: every 5 minutes`

## Pro tip
Use crontab.guru to double-check your schedule syntax!

