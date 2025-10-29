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
  "Use '-F:' to change delimiter: 'awk -F: '{print \$1}' /etc/passwd'" \
  "awk '{print \$1}' file.txt → Print first column" \
  "awk -F: '{print \$1}' /etc/passwd → Extract usernames" \
  "awk 'NR>1 {sum+=\$3} END {print sum}' data.txt → Sum column 3"

create_cmd "chmod" \
  "Change file permissions - controls who can read/write/execute files." \
  "755 = rwxr-xr-x. Use 'chmod +x script.sh' for executables!" \
  "chmod 755 script.sh → Make executable for all" \
  "chmod u+x file.sh → Add execute for owner" \
  "chmod -R 644 *.txt → Set permissions recursively" \
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
  "Download files from web - resumes interrupted downloads automatically." \
  "Use 'wget -c' to continue partial downloads even after connection drops!" \
  "wget https://example.com/file.zip → Download file" \
  "wget -r https://website.com → Download entire site" \
  "wget -c large-file.iso → Resume interrupted download" \
  "wget -b hugefile.zip → Download in background"

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
  "zip -e secure.zip file.txt → Password-protected" \
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
  "history -c → Clear history" \
  "!42 → Re-run command #42" \
  "!! → Re-run last command"

create_cmd "alias" \
  "Create shortcuts - custom abbreviations for long commands." \
  "Add to ~/.bashrc to make aliases permanent!" \
  "alias ll='ls -la' → Create shortcut" \
  "alias ..='cd ..' → Quick navigation" \
  "alias grep='grep --color=auto' → Colorize grep" \
  "alias update='sudo apt update && sudo apt upgrade' → Combo command"

echo ""
echo "✅ Created 42 commands with actionable pro tips!"
echo "Now run: ./collect_en.sh"
