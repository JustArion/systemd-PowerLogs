#!/bin/sh

# We check for root, if not we warn and exit
if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit
fi

script_root=$(dirname $0)

# We check if the src directory exists, if not we warn and exit
if [ ! -d "$script_root/src" ]; then
  echo "[!] Fatal | Source directory not found! The entire repo should be cloned, not just the install script"
  exit
fi

# $1 - Source
# $2 - Message
notif() {
  echo "[*] $1 | $2"
}

log_exit() {
	echo "[!] Error | $1" >&2
	exit
}

# This will copy the service contract and the service script into their respective locations
notif "Exec" "cp -r $script_root/src/ -> /"
cp -r $script_root/src/* / || log_exit "Failed to copy repo files to root"

# Give powerlogs execute permissions
notif "Exec" "chmod +x /usr/local/bin/powerlogs"
chmod +x /usr/local/bin/powerlogs || log_exit "Failed to give powerlogs execute permissions"

# Initialize the service via systemctl & systemd
notif "Exec" "systemctl enable powerlogs.service"
systemctl enable powerlogs.service || log_exit "Failed to initialize powerlogs service"
notif "Exec" "systemctl start powerlogs.service"
systemctl start powerlogs.service || log_exit "Failed to start powerlogs service"

# Enable the systemd-time-wait-sync.service in-case its disabled (default)
notif "Exec" "systemctl enable systemd-time-wait-sync.service"
systemctl enable systemd-time-wait-sync.service || log_exit "Failed to enable systemd-time-wait-sync.service"

notif "Done" "Installation complete!"