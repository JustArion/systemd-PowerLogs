Logs:
`$ > systemctl status powerlogs.service`
or
`$ > cat /var/log/powerlogs.log`

### Install
Requires
- sudo
- git

```
git clone https://github.com/JustArion/systemd-PowerLogs/ && cd systemd-PowerLogs
chmod +x Install.sh
sudo ./Install.sh
```

> [!NOTE]
> Tested and confirmed working on Arch & Ubuntu

##### Notable commands used in scripts
```
sudo
chmod
umask
flock
systemctl (& systemd by proxy)
date
rm
```
---
### Removal

```
chmod +x Remove.sh
sudo ./Remove.sh
```
