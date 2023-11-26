#!/usr/bin/env bash

set -euo pipefail

mkdir -p outputs/priv-output
exec &> script.log 2>&1

counter=1

device=$(lsblk -l | grep -E 'disk' | awk '{print $1}' | head -n 1)

# all require sudo
admin_actions=(
    "dmesg" #requires sudo
    "fdisk -l" #requires sudo
    "dmidecode"
    "hdparm -i /dev/$device"
    "hdparm -tT /dev/$device"
    "badblocks -s /dev/$device"
    "groupadd demo && cat /etc/group | grep demo"
    "useradd user-demo && cat /etc/passwd | grep user-demo"
    "usermod -aG demo user-demo && cat /etc/group | grep demo"
    "userdel user-demo && cat /etc/passwd | grep user-demo"
    "groupdel demo && cat /etc/group | grep demo"
)

for cmd in "${admin_actions[@]}"; do
    filename="outputs/priv-output/${counter}"

    echo "Running: $cmd"

    ./termshot -f "$filename.png" --show-cmd -- "$cmd | head -n 7" || echo "Error running: $cmd"

    ((counter++))
done
