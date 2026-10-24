# dmesg

Show kernel messages - hardware, drivers and boot events.

## Examples
- `sudo dmesg → All kernel messages`
- `sudo dmesg -T → Human-readable timestamps`
- `sudo dmesg -w → Follow new messages`
- `sudo dmesg --level=err,warn → Only problems`

## Pro tip
Plug in a USB device and run 'sudo dmesg -w' to see it appear live!

