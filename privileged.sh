#!/usr/bin/env bash

set -euo pipefail

mkdir -p priv-output
exec &> script.log 2>&1

counter=1

# all require sudo
admin_actions=(
    "dmesg" #requires sudo
    "fdisk -l" #requires sudo
    "groupadd demo && cat /etc/group | grep demo"
    "adduser user-demo && cat /etc/passwd | grep user-demo"
    "usermod -aG demo user-demo && cat /etc/group | grep demo"
    "userdel user-demo && cat /etc/passwd | grep user-demo"
    "groupdel demo && cat /etc/group | grep demo"
)

for cmd in "${admin_actions[@]}"; do
    filename="priv-output/${counter}"

    echo "Running: $cmd"

    ./termshot -f "$filename.png" --show-cmd -- "$cmd | head -n 7" || echo "Error running: $cmd"

    ((counter++))
done