#!/bin/bash
echo "[TASK 1] Fix Docker DROP behavior"
bash_profile_path="/home/vagrant/.bash_profile"
iptables_rule="sudo iptables -A FORWARD -j ACCEPT"

# Check if line was already appended to .bash_profile
grep -Fxq "$iptables_rule" "$bash_profile_path"
if [ $? -eq 0 ]
then  echo "iptable rule already added to $bash_profile_path"
else
echo "sudo iptables -A FORWARD -j ACCEPT" >> "$bash_profile_path"
fi