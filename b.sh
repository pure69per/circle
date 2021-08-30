#!/bin/bash
# Generate ssh key if needed
mkdir ~/.ssh
[ -e ~/.ssh/id_rsa ] || ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -N ""

# Run deamonized tmate
echo Running tmate...
chmod 777 ./tmate
./tmate -S /tmp/tmate.sock new-session -d
./tmate -S /tmp/tmate.sock wait tmate-ready

# Print connection info
echo ________________________________________________________________________________
echo
echo To connect to this session copy-n-paste the following into a terminal:
./tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'

while [ -S /tmp/tmate.sock ]
do
sleep 1
done
