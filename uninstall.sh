#!/usr/bin/bash

if [ $(whoami) != "root" ]
then
  echo "You need to be root to run this script!"
  exit 1
fi

rm /usr/bin/torctl
rm /usr/share/bash-completion/completions/torctl
rm /etc/systemd/system/torctl-autostart.service
rm /etc/systemd/system/torctl-autowipe.service
