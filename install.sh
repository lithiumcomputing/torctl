#!/usr/bin/bash

if [ $(whoami) != "root" ]
then
  echo "You need to be root to run this script!"
  exit 1
fi

sudo mv service/* /etc/systemd/system/
sudo mv bash-completion/torctl /usr/share/bash-completion/completions/torctl

sed -i 's/start_service iptables//' torctl
sed -i 's/TOR_UID="tor"/TOR_UID="debian-tor"/' torctl
sudo mv torctl /usr/bin/torctl

