#!/usr/bin/bash

if [ $(whoami) != "root" ]
then
  echo "You need to be root to run this script!"
  exit 1
fi

cp service/* /etc/systemd/system/
cp bash-completion/torctl /usr/share/bash-completion/completions/torctl

cp torctl torctl.bak
sed -i 's/start_service iptables//' torctl
sed -i 's/TOR_UID="tor"/TOR_UID="debian-tor"/' torctl

mv torctl /usr/bin/torctl
mv torctl.bak torctl
