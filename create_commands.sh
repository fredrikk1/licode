#!/bin/bash
# create_commands.sh - Creates concise, beginner-friendly command descriptions

DATA_DIR="data"
mkdir -p "$DATA_DIR"

# Function to create command file
create_cmd() {
  local name=$1
  local desc=$2
  local protip=$3
  shift 3
  local examples=("$@")
  
  cat > "$DATA_DIR/$name.md" << EOF
# $name

$desc

## Examples
EOF

  for example in "${examples[@]}"; do
    echo "- \`$example\`" >> "$DATA_DIR/$name.md"
  done
  
  cat >> "$DATA_DIR/$name.md" << EOF

## Pro tip
$protip

EOF
  
  echo "Created: $DATA_DIR/$name.md"
}

# Create all commands with actionable pro tips!

create_cmd "ls" \
  "List directory contents - shows all files and folders in your current location." \
  "Use 'ls -ltr' to see newest files at bottom - perfect for long directories!" \
  "ls -la → Show ALL files including hidden ones (start with .)" \
  "ls -lh → Human-readable sizes (1.5M instead of 1536000)" \
  "ls -lt → Sort by time, newest first" \
  "ls *.txt → Show only .txt files" \
  "ls -R → Show subdirectories too"

create_cmd "cd" \
  "Change directory - move between folders in your terminal." \
  "Just 'cd' with no path takes you home. Use 'cd -' to jump back to previous folder!" \
  "cd ~/Documents → Go to Documents folder" \
  "cd .. → Go up one level" \
  "cd - → Jump back to previous directory" \
  "cd /var/log → Go to absolute path" \
  "cd ../../ → Go up two levels"

create_cmd "pwd" \
  "Print working directory - shows where you are in the file system." \
  "Run 'pwd' before dangerous commands to verify you're in the right place!" \
  "pwd → Show current directory path" \
  "pwd -P → Show physical path (resolves links)"

create_cmd "mkdir" \
  "Make directory - creates new folders to organize your files." \
  "Use 'mkdir -p path/to/folder' to create all parent directories at once!" \
  "mkdir myFolder → Create single folder" \
  "mkdir -p project/src/components → Create nested folders" \
  "mkdir {docs,src,tests} → Create multiple folders at once" \
  "mkdir -m 755 public → Create with specific permissions"

create_cmd "rm" \
  "Remove files or directories - permanently deletes files. No undo!" \
  "Use 'rm -i' for confirmation prompts. Many pros alias rm to 'rm -i' by default!" \
  "rm file.txt → Delete a file" \
  "rm -r folder/ → Delete folder and contents" \
  "rm -i important.txt → Ask before deleting" \
  "rm *.log → Delete all .log files" \
  "rm -rf build/ → Force delete (careful!)"

create_cmd "cp" \
  "Copy files and directories - creates duplicates while keeping originals." \
  "Use 'cp -u' to only copy newer files - saves time on big backups!" \
  "cp file.txt backup.txt → Copy a file" \
  "cp -r folder/ backup/ → Copy entire folder" \
  "cp -p file.conf file.bak → Preserve timestamps/permissions" \
  "cp *.jpg ~/Pictures/ → Copy all images"

create_cmd "mv" \
  "Move or rename files - relocates files or changes their names." \
  "Moving is instant on same disk - just updates directory entry!" \
  "mv old.txt new.txt → Rename a file" \
  "mv file.txt ~/Documents/ → Move to another folder" \
  "mv *.pdf archive/ → Move all PDFs" \
  "mv -i file.txt ~/ → Ask before overwriting"

create_cmd "touch" \
  "Create empty files or update timestamps - quick way to make new files." \
  "Use 'touch file{1..10}.txt' to create 10 files instantly!" \
  "touch newfile.txt → Create empty file" \
  "touch script.sh && chmod +x script.sh → Create and make executable"

create_cmd "cat" \
  "Concatenate and display files - shows file contents in terminal." \
  "Use 'cat file1.txt file2.txt > merged.txt' to combine files!" \
  "cat file.txt → Display file contents" \
  "cat file1.txt file2.txt > combined.txt → Merge files" \
  "cat -n file.txt → Show with line numbers" \
  "cat file.txt | grep error → View and search"

create_cmd "echo" \
  "Display text - prints text to screen or files." \
  "Use 'echo -e' for newlines: 'echo -e \"Line1\\nLine2\"'" \
  "echo 'Hello World' → Print text" \
  "echo \$PATH → Show environment variable" \
  "echo 'text' > file.txt → Write to file" \
  "echo 'more' >> file.txt → Append to file"

create_cmd "grep" \
  "Search for text patterns - finds content in files super fast." \
  "Use 'grep -r' to search entire folders, 'grep -v' to show non-matching lines!" \
  "grep 'error' logfile.txt → Search for 'error'" \
  "grep -r 'TODO' . → Search all files recursively" \
  "grep -i 'warning' *.log → Case-insensitive search" \
  "ps aux | grep nginx → Search process list" \
  "grep -n 'function' script.js → Show line numbers"

create_cmd "find" \
  "Search for files and directories - finds files by name, size, date, etc." \
  "Use 'find . -name \"*.tmp\" -delete' to find and delete in one command!" \
  "find . -name '*.txt' → Find all .txt files" \
  "find /var/log -mtime -7 → Files modified last 7 days" \
  "find . -type f -size +10M → Files larger than 10MB" \
  "find . -name '*.tmp' -delete → Find and delete"

create_cmd "sed" \
  "Stream editor - edits text without opening files." \
  "Test without '-i' first to see changes before saving!" \
  "sed 's/old/new/g' file.txt → Replace all occurrences" \
  "sed -i 's/foo/bar/g' *.txt → Replace in-place" \
  "sed -n '10,20p' file.txt → Print lines 10-20" \
  "sed '/pattern/d' file.txt → Delete matching lines"

create_cmd "awk" \
  "Text processing - extracts and manipulates columns of data." \
  "Use '-F,' for comma-separated files and 'NR>1' to skip the header line!" \
  "awk '{print \$1}' file.txt → Print first column" \
  "awk -F: '{print \$1}' /etc/passwd → Extract usernames" \
  "awk 'NR>1 {sum+=\$3} END {print sum}' data.txt → Sum column 3"

create_cmd "chmod" \
  "Change file permissions - controls who can read/write/execute files." \
  "755 = rwxr-xr-x. Use 'chmod +x script.sh' for executables!" \
  "chmod 755 script.sh → Make executable for all" \
  "chmod u+x file.sh → Add execute for owner" \
  "chmod -R a+rX folder/ → Make folder readable recursively" \
  "chmod go-w file.txt → Remove write for group/others"

create_cmd "chown" \
  "Change file owner - transfers ownership of files." \
  "Use 'chown -R user:group folder/' to change entire directories!" \
  "sudo chown user:group file.txt → Change owner and group" \
  "sudo chown -R www-data:www-data /var/www → Web server ownership" \
  "sudo chown user file.txt → Change only owner"

create_cmd "sudo" \
  "Execute as superuser - run commands with admin privileges." \
  "Use 'sudo -i' for root shell. 'sudo !!' reruns last command as root!" \
  "sudo apt update → Run package manager as admin" \
  "sudo systemctl restart nginx → Restart service" \
  "sudo -i → Start root shell" \
  "sudo -u postgres psql → Run as different user"

create_cmd "git" \
  "Version control system - tracks code changes and enables collaboration." \
  "Use 'git stash' to save work-in-progress without committing!" \
  "git status → Check what changed" \
  "git add . → Stage all changes" \
  "git commit -m 'message' → Save changes" \
  "git push origin main → Upload to remote" \
  "git log --oneline → View history"

create_cmd "curl" \
  "Transfer data from servers - download files and test APIs." \
  "Use 'curl -I' to show just headers. 'curl -L' follows redirects!" \
  "curl https://example.com → Fetch webpage" \
  "curl -O https://site.com/file.zip → Download file" \
  "curl -X POST -d 'data' api.com → Send POST request" \
  "curl -I website.com → Show headers only"

create_cmd "wget" \
  "Download files from web - can resume interrupted downloads." \
  "Use 'wget -c' to continue partial downloads even after connection drops!" \
  "wget https://example.com/file.zip → Download file" \
  "wget -r https://website.com → Download entire site" \
  "wget -c https://example.com/large-file.iso → Resume interrupted download" \
  "wget -b https://example.com/hugefile.zip → Download in background"

create_cmd "tar" \
  "Archive and compress files - bundles files into single archive." \
  "Use 'tar -tzf archive.tar.gz' to peek inside without extracting!" \
  "tar -czvf archive.tar.gz folder/ → Create archive" \
  "tar -xzvf archive.tar.gz → Extract archive" \
  "tar -tzf archive.tar.gz → List contents" \
  "tar -xzvf file.tar.gz -C /dest → Extract to folder"

create_cmd "zip" \
  "Create zip archives - works on all operating systems." \
  "Use 'zip -e' to create password-protected archives!" \
  "zip archive.zip file1.txt file2.txt → Create zip" \
  "zip -r folder.zip folder/ → Zip entire folder" \
  "zip -e secure.zip file.txt → Password-protect (weak)" \
  "zip -9 compressed.zip file.txt → Maximum compression"

create_cmd "unzip" \
  "Extract zip archives - opens .zip files." \
  "Use 'unzip -l' to show contents without extracting!" \
  "unzip archive.zip → Extract to current folder" \
  "unzip -l archive.zip → List contents (preview)" \
  "unzip archive.zip -d /dest → Extract to folder" \
  "unzip '*.zip' → Extract all zip files"

create_cmd "ssh" \
  "Secure shell - connect to remote computers securely." \
  "Set up SSH keys (ssh-keygen) to login without passwords!" \
  "ssh user@server.com → Connect to server" \
  "ssh -p 2222 user@server.com → Use custom port" \
  "ssh -i ~/.ssh/key.pem user@server.com → Use specific key" \
  "ssh user@server 'ls -la' → Run single command"

create_cmd "scp" \
  "Secure copy - transfer files between computers over SSH." \
  "Use capital -P for port: 'scp -P 2222' (different from ssh -p)!" \
  "scp file.txt user@server:/path/ → Upload file" \
  "scp -r folder/ user@server:~/ → Upload folder" \
  "scp user@server:/file.txt . → Download file" \
  "scp -P 2222 file.txt user@server:~/ → Custom port"

create_cmd "rsync" \
  "Remote sync - efficiently sync files by copying only differences." \
  "Add '--dry-run' to preview changes before committing!" \
  "rsync -avz source/ dest/ → Sync folders" \
  "rsync -avz --delete src/ backup/ → Perfect mirror" \
  "rsync -avz -e ssh folder/ user@server:~/ → Sync via SSH"

create_cmd "df" \
  "Disk free - shows available disk space." \
  "Use 'df -h | grep -v tmpfs' to hide temporary filesystems!" \
  "df -h → Show space in GB/MB" \
  "df -h /home → Check specific mount" \
  "df -i → Show inode usage" \
  "df -h | grep -v tmpfs → Hide temp filesystems"

create_cmd "du" \
  "Disk usage - shows how much space files/folders use." \
  "Use 'du -sh * | sort -h' to show largest folders first!" \
  "du -sh folder/ → Show folder size" \
  "du -h --max-depth=1 → Show subfolders only" \
  "du -sh * | sort -h → Sort by size" \
  "du -ha /var/log → Show all files"

create_cmd "top" \
  "Table of processes - real-time system monitor." \
  "Press 'P' for CPU sort, 'M' for memory, 'k' to kill, 'q' to quit!" \
  "top → Launch process monitor" \
  "top -u username → Show user's processes only" \
  "top -p PID → Monitor specific process"

create_cmd "htop" \
  "Interactive process viewer - prettier version of 'top' with colors." \
  "Press F6 to sort, F9 to kill, F5 for tree view!" \
  "htop → Launch colorful monitor" \
  "htop -u username → Show user's processes" \
  "htop -p PID1,PID2 → Monitor specific processes"

create_cmd "ps" \
  "Process status - snapshot of running processes." \
  "Use 'ps aux --sort=-%mem' to find memory hogs!" \
  "ps aux → Show all processes" \
  "ps aux | grep nginx → Find specific process" \
  "ps -ef → Alternative format" \
  "ps -u username → User's processes" \
  "ps -p PID → Specific process info"

create_cmd "kill" \
  "Terminate processes - stops running programs." \
  "Try normal kill first, use -9 only as last resort!" \
  "kill PID → Ask process to stop (polite)" \
  "kill -9 PID → Force kill (last resort)" \
  "killall firefox → Kill by program name" \
  "kill -SIGTERM PID → Same as regular kill"

create_cmd "man" \
  "Manual pages - built-in documentation for every command." \
  "Press '/' to search within a man page, 'q' to quit!" \
  "man ls → Read ls documentation" \
  "man -k search → Search all manuals" \
  "man 5 passwd → Read file format docs" \
  "man -f command → Short description"

create_cmd "which" \
  "Locate a command - shows full path of executables." \
  "Use 'which -a python' to show ALL installed versions!" \
  "which python → Find which Python runs" \
  "which -a python → Show all Python installations" \
  "which gcc → Find compiler location"

create_cmd "nano" \
  "Simple text editor - beginner-friendly with shortcuts shown at bottom." \
  "Ctrl+O saves, Ctrl+X exits, Ctrl+W searches!" \
  "nano file.txt → Edit file" \
  "nano +10 file.txt → Jump to line 10" \
  "nano -w file.txt → Disable line wrap"

create_cmd "vim" \
  "Vi improved editor - powerful but steep learning curve." \
  "Press 'i' to insert, ESC to exit mode, ':wq' to save and quit!" \
  "vim file.txt → Edit in vim" \
  "vim +10 file.txt → Jump to line 10" \
  "vim -d file1.txt file2.txt → Compare files"

create_cmd "less" \
  "View files - displays text one page at a time." \
  "Press '/' to search, 'n' for next match, 'G' for end, 'g' for start!" \
  "less file.txt → View file (space to scroll)" \
  "less +F /var/log/syslog → Follow in real-time" \
  "ps aux | less → Paginate output" \
  "less -N file.txt → Show line numbers"

create_cmd "head" \
  "Output first lines - shows beginning of files." \
  "Pipe with commands: 'ls -l | head' shows first few items!" \
  "head file.txt → Show first 10 lines" \
  "head -n 20 file.txt → Show first 20 lines" \
  "head -c 100 file.txt → Show first 100 bytes"

create_cmd "tail" \
  "Output last lines - shows end of files." \
  "Use 'tail -f error.log | grep ERROR' to watch for errors in real-time!" \
  "tail file.txt → Show last 10 lines" \
  "tail -n 50 file.txt → Show last 50 lines" \
  "tail -f /var/log/syslog → Follow file live" \
  "tail -f error.log | grep ERROR → Watch for errors"

create_cmd "ln" \
  "Create links - makes shortcuts to files or directories." \
  "Always use 'ln -s' for symbolic links - they're more flexible!" \
  "ln -s /path/to/file shortcut → Create link" \
  "ln -s /opt/app/config ~/.config/app → Link config" \
  "ln file hardlink → Create hard link"

create_cmd "history" \
  "Command history - shows previously executed commands." \
  "Press Ctrl+R for interactive search! '!!' reruns last command!" \
  "history → Show recent commands" \
  "history | grep git → Search history" \
  "history -c → Clear session history" \
  "!42 → Re-run command #42" \
  "!! → Re-run last command"

create_cmd "alias" \
  "Create shortcuts - custom abbreviations for long commands." \
  "Add to ~/.bashrc to make aliases permanent!" \
  "alias ll='ls -la' → Create shortcut" \
  "alias ..='cd ..' → Quick navigation" \
  "alias grep='grep --color=auto' → Colorize grep" \
  "alias update='sudo apt update && sudo apt upgrade' → Combo command"

create_cmd "basename" \
  "Strip the path - leaves just the file name, optionally without suffix." \
  "Great in loops: 'for f in *.png; do echo \"\$(basename \"\$f\" .png)\"; done'!" \
  "basename /var/log/syslog → File name only" \
  "basename photo.jpg .jpg → Remove the suffix too" \
  "dirname /var/log/syslog → Folder part only" \
  "realpath file.txt → Full absolute path"

create_cmd "chgrp" \
  "Change group ownership - set which group owns files and folders." \
  "Combine with 'chmod g+s dir' so new files inherit the group!" \
  "chgrp staff file.txt → Change group" \
  "sudo chgrp -R www-data /var/www → Change recursively" \
  "ls -l file.txt → Check the group column"

create_cmd "crontab" \
  "Schedule recurring jobs - run commands automatically at set times." \
  "Use crontab.guru to double-check your schedule syntax!" \
  "crontab -e → Edit your scheduled jobs" \
  "crontab -l → List your jobs" \
  "0 3 * * * /path/to/backup.sh → Line: every night at 03:00" \
  "*/5 * * * * /path/to/cmd → Line: every 5 minutes"

create_cmd "cut" \
  "Cut out columns - extract fields or characters from each line." \
  "Use 'cut -d: -f1 /etc/passwd' to list every user on the system!" \
  "cut -d, -f1 data.csv → First column of a CSV" \
  "cut -d: -f1,7 /etc/passwd → Users and their shells" \
  "cut -c1-10 file.txt → First 10 characters per line" \
  "cut -f2 data.tsv → Second tab-separated field"

create_cmd "date" \
  "Show date and time - print or format the current date." \
  "Use 'date +%F' in file names for sortable dates like 2026-10-16!" \
  "date → Current date and time" \
  "date +%F → Date as YYYY-MM-DD" \
  "date -d tomorrow → Tomorrow's date" \
  "date +%s → Seconds since 1970 (Unix time)"

create_cmd "diff" \
  "Compare files line by line - shows exactly what changed." \
  "Use 'diff -u' for the familiar patch format that git uses!" \
  "diff old.txt new.txt → Show differences" \
  "diff -u old.txt new.txt → Unified (patch) format" \
  "diff -r dir1 dir2 → Compare whole folders" \
  "diff -y a.txt b.txt → Side by side"

create_cmd "dig" \
  "DNS lookup - asks DNS servers about domains and records." \
  "Use 'dig +short' for just the answer, perfect in scripts!" \
  "dig example.com → Full DNS answer" \
  "dig +short example.com → Just the IP" \
  "dig MX example.com → Mail servers" \
  "dig @1.1.1.1 example.com → Ask a specific DNS server"

create_cmd "dmesg" \
  "Show kernel messages - hardware, drivers and boot events." \
  "Plug in a USB device and run 'sudo dmesg -w' to see it appear live!" \
  "sudo dmesg → All kernel messages" \
  "sudo dmesg -T → Human-readable timestamps" \
  "sudo dmesg -w → Follow new messages" \
  "sudo dmesg --level=err,warn → Only problems"

create_cmd "env" \
  "Environment variables - list them or run a command with changes." \
  "Use '#!/usr/bin/env python3' in scripts to find the interpreter on any system!" \
  "env → List all environment variables" \
  "env | grep PATH → Find a variable" \
  "env LANG=C sort file.txt → Run with a changed variable" \
  "printenv HOME → Print one variable"

create_cmd "export" \
  "Export variables - pass them on to programs you start." \
  "Put exports in ~/.bashrc to keep them in every new terminal!" \
  "export EDITOR=vim → Set default editor" \
  "export PATH=\"\$HOME/bin:\$PATH\" → Add a folder to PATH" \
  "export -p → List exported variables" \
  "unset VAR → Remove a variable"

create_cmd "file" \
  "Detect file type - looks at the content, not the extension." \
  "Use it on downloads to check that a '.pdf' really is a PDF!" \
  "file photo.jpg → Show file type" \
  "file * → Types of all files here" \
  "file -i doc.txt → Show MIME type"

create_cmd "free" \
  "Show memory usage - RAM and swap, used and available." \
  "Look at the 'available' column, not 'free' - Linux uses spare RAM as cache!" \
  "free -h → Human-readable memory usage" \
  "free -m → Values in megabytes" \
  "free -h -s 2 → Refresh every 2 seconds"

create_cmd "gzip" \
  "Compress files - small, fast and available everywhere." \
  "Use 'gzip -k' to keep the original file!" \
  "gzip file.txt → Compress (replaces file)" \
  "gzip -k file.txt → Keep the original" \
  "gunzip file.txt.gz → Decompress" \
  "zcat file.gz → Print contents of a .gz file"

create_cmd "hostname" \
  "Show host name - the name of your machine on the network." \
  "Use 'hostname -I' to quickly see your machine's IP addresses!" \
  "hostname → Show host name" \
  "hostname -I → Show all IP addresses" \
  "hostnamectl → Detailed host info (systemd)" \
  "sudo hostnamectl set-hostname web01 → Change host name"

create_cmd "id" \
  "User and group IDs - shows who you are and which groups you belong to." \
  "Log out and in again after being added to a group, then check with 'id'!" \
  "id → Your UID, GID and groups" \
  "id alice → Another user's IDs" \
  "id -u → Only your numeric user ID" \
  "id -Gn → All your group names"

create_cmd "ip" \
  "Network configuration - shows interfaces, addresses and routes." \
  "'ip -br a' gives a clean one-line-per-interface overview!" \
  "ip a → Show all IP addresses" \
  "ip -br a → Brief address overview" \
  "ip r → Show routing table" \
  "sudo ip link set eth0 up → Bring an interface up"

create_cmd "journalctl" \
  "System logs - read everything collected by systemd." \
  "Use 'journalctl -u name -f' to follow one service's log live!" \
  "journalctl -u nginx → Logs for one service" \
  "journalctl -f → Follow new log lines" \
  "journalctl --since '1 hour ago' → Time filter" \
  "journalctl -b -p err → Errors from this boot"

create_cmd "lsblk" \
  "List block devices - disks, partitions and where they are mounted." \
  "Run 'lsblk -f' before formatting to be sure you pick the right disk!" \
  "lsblk → Disks and partitions" \
  "lsblk -f → Show filesystems and UUIDs" \
  "lsblk -o NAME,SIZE,MOUNTPOINT → Choose columns"

create_cmd "lsof" \
  "List open files - see which process uses a file, folder or port." \
  "'sudo lsof -i :8080' finds what is blocking your port!" \
  "sudo lsof -i :80 → What uses port 80" \
  "sudo lsof -u alice → Files opened by a user" \
  "lsof +D /var/log → Who uses files in a folder" \
  "lsof -p 1234 → Files opened by a process"

create_cmd "mount" \
  "Attach filesystems - make a disk or image available in a folder." \
  "Use 'findmnt' for a readable tree of everything that is mounted!" \
  "mount → List mounted filesystems" \
  "sudo mount /dev/sdb1 /mnt → Mount a partition" \
  "sudo umount /mnt → Unmount" \
  "sudo mount -o loop disk.iso /mnt → Mount an ISO image"

create_cmd "nice" \
  "CPU priority - run commands with lower (or higher) priority." \
  "Prefix heavy jobs with 'nice -n 19' so your desktop stays responsive!" \
  "nice -n 19 tar czf backup.tgz /home → Lowest priority" \
  "sudo nice -n -5 cmd → Higher priority (needs root)" \
  "renice 10 -p 1234 → Change a running process"

create_cmd "nohup" \
  "Ignore hangups - keep a command running after you log out." \
  "For anything long-running, tmux or screen is usually nicer!" \
  "nohup ./script.sh & → Run in background, immune to logout" \
  "nohup cmd > out.log 2>&1 & → Choose the log file" \
  "tail -f nohup.out → Watch default output"

create_cmd "ping" \
  "Test network reachability - sends packets and measures the round-trip time." \
  "Use 'ping -c 4' so it stops by itself instead of running forever!" \
  "ping google.com → Ping until Ctrl+C" \
  "ping -c 4 1.1.1.1 → Send exactly 4 packets" \
  "ping -i 0.5 example.com → Ping every half second" \
  "ping -W 2 example.com → Wait max 2 seconds for reply"

create_cmd "pkill" \
  "Kill by name - stop processes without looking up the PID." \
  "Run 'pgrep -a name' first to see what would be killed!" \
  "pkill firefox → Stop processes by name" \
  "pgrep -a node → Find matching processes first" \
  "pkill -f 'python app.py' → Match the full command line" \
  "pkill -9 hung-app → Force kill (last resort)"

create_cmd "sha256sum" \
  "Checksums - compute or verify SHA-256 hashes to check file integrity." \
  "Always verify downloaded ISOs with 'sha256sum -c' before installing!" \
  "sha256sum file.iso → Show checksum" \
  "sha256sum -c SHA256SUMS → Verify against a list" \
  "sha256sum *.tar.gz > sums.txt → Save checksums" \
  "echo -n text | sha256sum → Hash a string"

create_cmd "sleep" \
  "Pause for a given time - useful in scripts and loops." \
  "Combine with '&&' to run something later: 'sleep 600 && notify-send done'!" \
  "sleep 5 → Wait 5 seconds" \
  "sleep 2m → Wait 2 minutes" \
  "sleep 0.5 → Wait half a second" \
  "while true; do date; sleep 1; done → Simple clock loop"

create_cmd "sort" \
  "Sort lines of text - alphabetically, numerically or by column." \
  "Combine 'sort | uniq -c | sort -rn' to rank the most common lines!" \
  "sort names.txt → Sort alphabetically" \
  "sort -r names.txt → Reverse order" \
  "sort -n numbers.txt → Sort numerically" \
  "sort -u list.txt → Sort and remove duplicates"

create_cmd "ss" \
  "Socket statistics - shows open ports and connections (modern netstat)." \
  "'sudo ss -tulpn' shows which program listens on which port!" \
  "sudo ss -tulpn → Listening TCP/UDP ports with programs" \
  "ss -t → Active TCP connections" \
  "ss -s → Summary statistics" \
  "ss -lt 'sport = :22' → Who listens on port 22"

create_cmd "stat" \
  "Show detailed file info - size, permissions, owner and timestamps." \
  "'stat -c %a file' prints permissions as a number like 644!" \
  "stat file.txt → All file details" \
  "stat -c %s file.txt → Size in bytes" \
  "stat -c %a file.txt → Numeric permissions" \
  "stat -c %y file.txt → Last modification time"

create_cmd "systemctl" \
  "Control systemd services - start, stop, enable and inspect them." \
  "'systemctl --failed' instantly shows which services are broken!" \
  "systemctl status nginx → Service status" \
  "sudo systemctl restart nginx → Restart a service" \
  "sudo systemctl enable --now nginx → Start now and on boot" \
  "systemctl list-units --type=service → List services"

create_cmd "tee" \
  "Split output - shows output on screen and saves it to a file at the same time." \
  "Use 'echo line | sudo tee -a /etc/file' to append to root-owned files!" \
  "ls | tee files.txt → Show and save output" \
  "make 2>&1 | tee build.log → Log a build while watching it" \
  "echo hi | tee -a log.txt → Append instead of overwrite" \
  "echo 'x' | sudo tee /etc/myapp.conf → Write a root-owned file"

create_cmd "tmux" \
  "Terminal multiplexer - multiple windows and sessions that survive disconnects." \
  "Start every SSH session with 'tmux new -A -s main' - never lose work again!" \
  "tmux new -s work → Named session" \
  "tmux ls → List sessions" \
  "tmux attach -t work → Re-attach to a session" \
  "Ctrl+b d → Detach (keeps running)"

create_cmd "tr" \
  "Translate characters - replace, squeeze or delete characters in a stream." \
  "Squeeze repeated spaces with tr -s before splitting columns with cut!" \
  "echo hello | tr a-z A-Z → Convert to uppercase" \
  "tr '[:upper:]' '[:lower:]' < in.txt → Convert to lowercase" \
  "tr -s ' ' < file.txt → Squeeze repeated spaces" \
  "echo 'a,b,c' | tr , ' ' → Commas to spaces"

create_cmd "tree" \
  "Show directories as a tree - see the structure of folders at a glance." \
  "Use 'tree -L 2 -I node_modules' to keep big projects readable!" \
  "tree → Show current folder as a tree" \
  "tree -L 2 → Limit depth to 2 levels" \
  "tree -I 'node_modules|.git' → Ignore matching folders"

create_cmd "uname" \
  "Print system information - kernel name, version and architecture." \
  "'uname -r' tells you the kernel version when searching for drivers!" \
  "uname -a → All system info" \
  "uname -r → Kernel release" \
  "uname -m → Machine architecture (x86_64, aarch64)"

create_cmd "uniq" \
  "Filter repeated lines - removes or counts adjacent duplicates." \
  "uniq only sees neighbours - always 'sort' first!" \
  "sort list.txt | uniq → Remove duplicate lines" \
  "sort list.txt | uniq -c → Count occurrences" \
  "sort list.txt | uniq -d → Show only duplicates" \
  "sort list.txt | uniq -u → Lines that appear once"

create_cmd "uptime" \
  "System uptime - how long it has been running and the load average." \
  "Load average above your CPU count ('nproc') means processes are waiting!" \
  "uptime → Uptime, users and load" \
  "uptime -p → Pretty format (up 3 days)" \
  "uptime -s → Time the system booted"

create_cmd "watch" \
  "Repeat a command - reruns it and shows the output full-screen." \
  "Add '-d' to highlight what changed between updates!" \
  "watch df -h → Refresh disk usage every 2s" \
  "watch -n 1 free -h → Refresh every second" \
  "watch -d ls -l → Highlight changes"

create_cmd "wc" \
  "Word count - counts lines, words and bytes in files or input." \
  "Pipe anything into 'wc -l' to count results, e.g. 'ls | wc -l'!" \
  "wc file.txt → Lines, words and bytes" \
  "wc -l file.txt → Count lines only" \
  "wc -w essay.txt → Count words only"

create_cmd "whoami" \
  "Current user - prints the user name you are running as." \
  "Handy in scripts to refuse running as root by mistake!" \
  "whoami → Show your user name" \
  "sudo whoami → Shows root" \
  "who → Everyone logged in"

create_cmd "xargs" \
  "Build commands from input - turns lines of input into arguments." \
  "Use 'find ... -print0 | xargs -0' so filenames with spaces work!" \
  "find . -name '*.log' -print0 | xargs -0 rm → Delete found files" \
  "find . -name '*.txt' -print0 | xargs -0 wc -l → Count lines in found files" \
  "cat urls.txt | xargs -n1 curl -O → Download each URL" \
  "echo a b c | xargs -n1 → One argument per line"

echo ""
echo "✅ Created 83 commands with actionable pro tips!"
echo "Now run: ./collect_en.sh"
