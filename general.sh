#!/usr/bin/env bash

set -euo pipefail

mkdir -p gen-output

exec &> script.log 2>&1

device=$(lsblk -l | grep -E 'disk' | awk '{print $1}' | head -n 1)

# List of commands
hw_commands=(
    "cat /proc/cpuinfo"
    "free -h"
    "lsblk"
    "lshw"
    "lspci -tv"
    "lsusb -tv"
    "dmidecode"
    "hdparm -i /dev/$device"
    "hdparm -tT /dev/$device"
    "badblocks -s /dev/$device"
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
    "mkdir my_directory && ls"
    "echo 'Hello, World!' > my_file.txt && ls"
    "cp my_file.txt copied_file.txt && ls"
    "cp -r my_directory copied_directory && ls"
    "mv my_file.txt renamed_file.txt && ls"
    "ln -s my_file.txt symbolic_link.txt && ls"
    "rm copied_file.txt && ls"
    "rsync -a my_directory backup && ls"
    "rm -r copied_directory && ls"
    "rm -rf symbolic_link.txt && ls"
    "more renamed_file.txt"
    "head renamed_file.txt"
    "tail renamed_file.txt"
    "wc renamed_file.txt"
    "ls"
    "ls -a"
    "scp renamed_file.txt backup && ls backup"
    "tar cf backup.tar backup && ls"
    "tar xf backup.tar && ls"
    "tar czf backup.tar.gz backup && ls"
    "gzip renamed_file.txt && ls"
)


for cmd in "${file_commands[@]}"; do
    filename="gen-output/${counter}"

    echo "Running: $cmd"

    ./termshot -f "$filename.png" --show-cmd -- "$cmd | head -n 7" || echo "Error running: $cmd"

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
