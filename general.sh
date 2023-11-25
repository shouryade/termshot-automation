#!/usr/bin/env bash

set -euo pipefail

mkdir -p gen-output

exec &> script.log 2>&1



# List of commands
hw_commands=(
    "cat /proc/cpuinfo"
    "free -h"
    "lsblk"
    "lshw"
    "lspci -tv"
    "lsusb -tv"
    "ps"
    "pstree"
    "psmap"
    "top"
    "fg"
    "bg"
    "lsof -w -u $USER"
    "ip addr show"
    "ifconﬁg"
    "netstat -pnltu"
    "netstat -nutlp"
    "whois google.com"
    "dig +noall +answer google.com"
    "dig +noall +answer -x google.com"
    "hostname -i"
    "dig +noall +answer -x 8.8.8.8"
    "host google.com"
    "wget -q --show-progress https://code.jquery.com/jquery-3.6.0.min.js"
    "df -h"
    "du -h"
    "du -ah"
    "du -sh"
    "findmnt"
    "id"
    "last"
    "who"
    "w"
    "telnet india.colorado.edu 13"
    "pwd"
    "uname -r"
    "uname -a"
    "uptime"
    "date"
    "cal"
    "last reboot"
    "date"
    "timedatectl"
    "whoami"
)

counter=1
for cmd in "${hw_commands[@]}"; do
    filename="gen-output/${counter}"

    echo "Running: $cmd"

    ./termshot -f "$filename.png" --show-cmd -- "$cmd | head -n 7" || echo "Error running: $cmd"
    
    ((counter++))
done



# Array of file commands
file_commands=(
    "mkdir my_directory && ls -lh"
    "echo 'Hello, World!' > my_file.txt && ls -lh"
    "cp my_file.txt copied_file.txt && ls -lh"
    "cp -r my_directory copied_directory && ls -lh"
    "mv my_file.txt renamed_file.txt && ls -lh"
    "ln -s my_file.txt symbolic_link.txt && ls -lh"
    "rm copied_file.txt && ls -lh"
    "rsync -a my_directory backup && ls -lh"
    "rm -r copied_directory && ls -lh"
    "rm -rf symbolic_link.txt && ls -lh"
    "more renamed_file.txt"
    "head renamed_file.txt"
    "tail renamed_file.txt"
    "wc renamed_file.txt"
    "ls"
    "ls -a"
    "scp renamed_file.txt backup && ls -lh backup"
    "tar cf backup.tar backup && ls -lh"
    "tar xf backup.tar && ls -lh"
    "tar czf backup.tar.gz backup && ls -lh"
    "gzip renamed_file.txt && ls -lh"
)


for cmd in "${file_commands[@]}"; do
    filename="gen-output/${counter}"

    echo "Running: $cmd"

    ./termshot -f "$filename.png" --show-cmd -- "$cmd" || echo "Error running: $cmd"

    ((counter++))
done

# searching
echo "loreum ipsum dolor sit amet consectetur adipiscing elit" > my_file.txt
search_commands=(
    "grep -i 'lorem' my_file.txt"
    "grep -r 'lorem' ."
    "locate my_file.txt"
    "find . -name [a-z]*.txt"
    "find . -size +1M"
)

for cmd in "${search_commands[@]}"; do
    filename="gen-output/${counter}"

    echo "Running: $cmd"

    ./termshot -f "$filename.png" --show-cmd -- "$cmd | head -n 7" || echo "Error running: $cmd"

    ((counter++))
done
