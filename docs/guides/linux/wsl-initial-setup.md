# WSL Initial Setup

## Configure SSH

#### 1) Reinstall OpenSSH-Server

```
sudo apt-get remove openssh-server
sudo apt-get install openssh-server
```

#### 2) Configure SSH

In `/etc/ssh/sshd_config`:

```
Port 2222
PermitRootLogin yes
PasswordAuthentication yes
```

Host Windows and WSL use the same set of port IDs, and Windows has higher priority. To avoid conflict, use 2222 as the SSH port ID for WSL.

To start SSH service, run

```
service ssh start
```

## Run at Start-up (of Host Windows)

New file `/etc/wsl-init.sh`:

```
#! /bin/sh
service ssh start
...
```

New file `wsl-init.vbs` in `shell:startup` in host Windows:

```
Set ws = WScript.CreateObject("WScript.Shell")
ws.run "wsl -d Ubuntu-20.04 -u root sh /etc/wsl-init.sh"
```
