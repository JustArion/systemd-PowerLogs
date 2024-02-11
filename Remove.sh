#!/bin/sh

# We check for root, if not we warn and exit
if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit
fi

# $1 - Source
# $2 - Message
notif() {
  echo "[*] $1 | $2"
}

# Removal Targets
powerlogs_script=/usr/local/bin/powerlogs
powerlogs_service=/etc/systemd/system/powerlogs.service
powerlogs_log=/var/log/powerlogs.log
powerlogs_timetracker=/var/log/powerlogs.sta

notif "Exec" "systemctl disable powerlogs.service 2> /dev/null"
systemctl disable powerlogs.service 2> /dev/null
notif "Exec" "systemctl stop powerlogs.service 2> /dev/null"
systemctl stop powerlogs.service 2> /dev/null

# We check if the target files exist, and delete them
if [ -f $powerlogs_script ]; then
  notif "Exec" "rm $powerlogs_script"
  rm $powerlogs_script
fi

if [ -f $powerlogs_service ]; then
  notif "Exec" "rm $powerlogs_service"
  rm $powerlogs_service
fi

if [ -f $powerlogs_log ]; then
  notif "Exec" "rm $powerlogs_log"
  rm $powerlogs_log
fi

if [ -f $powerlogs_timetracker ]; then
  notif "Exec" "rm $powerlogs_timetracker"
  rm $powerlogs_timetracker
fi

notif "Done" "PowerLogs has been removed"