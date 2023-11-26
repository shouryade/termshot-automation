#!/usr/bin/env bash

set -euo pipefail

mkdir -p outputs/tricky-output
echo "here"
exec &> script.log 2>&1


counter=1

filename="outputs/tricky-output/${counter}"
exec -a DummyProcess sleep 1000000 &
echo -e "\e[1;31m pkill -9 -f DummyProcess\e[0m"
pkill -9 -f DummyProcess
./termshot -f "$filename.png" --show-cmd -- "tail -n 2 script.log"
((counter++))

filename="outputs/tricky-output/${counter}"
exec -a DummyProcess sleep 1000000 &
echo -e "\e[1;31m kill -9 $(pidof DummyProcess)\e[0m"
kill -9 "$(pidof DummyProcess)"
sleep 1
./termshot -f "$filename.png" --show-cmd -- "tail -n 2 script.log"
((counter++))

filename="outputs/tricky-output/${counter}"
exec -a DummyProcess sleep 100000 &
# pgrep -fl DummyProcess
echo -e "\e[1;31mkillall sleep\e[0m"
killall -9 sleep
./termshot -f "$filename.png" --show-cmd -- "tail -n 2 script.log"

# cleaning up in case one of the above commands failed
pkill -9 -f DummyProcess

exit 0