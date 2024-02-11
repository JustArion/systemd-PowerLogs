Logs:
<br>`$ > systemctl status powerlogs.service`
<br>or<br>
`$ > cat /var/log/powerlogs.log`

### Install
Requirements
- sudo
- git

```
git clone https://github.com/JustArion/systemd-PowerLogs/ && cd systemd-PowerLogs
chmod +x Install.sh
sudo ./Install.sh
```

You can now safely remove the `systemd-PowerLogs` directory that you cloned.

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
```
---
### Removal

```
chmod +x Remove.sh
sudo ./Remove.sh
```
