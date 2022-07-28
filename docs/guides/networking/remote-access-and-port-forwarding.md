# Remote Access and Port Forwarding

```
     Cloud Server
       /     \
      /       \
Local PC --- Remote PC --- Target Server
```

The target server is accessible to the remote PC only, for they are in the same LAN.

Objective and requirements:

* Access the target server from local PC
* Stability and low latency
* No login to the remote PC (no SSH port forwarding using `ssh -L/-R/-D`)
* No root privilege on the target server (no new VLAN involving the target server)


## Setup Zero Tier

Install Zero Tier on both local and remote PC, and join the same network, see <https://zerotier.atlassian.net/wiki/spaces/SD/pages/8454145/Getting+Started+with+ZeroTier>{:target="_blank"}.


## Setup moon server for Zero Tier

The connection may be slow if local and remote machines are far away or use different ISP. To improve stability and reduce latency, we need to set up a moon server that helps establish the connection between local and remote machines (note that communications are still P2P). Refer to <https://docs.zerotier.com/zerotier/moons>{:target="_blank"} for more information.

The following commands operate on the cloud server that runs Ubuntu on it, and requires elevated privilege.

Install Zero Tier, see <https://www.zerotier.com/download/>{:target="_blank"}

Join the same network as above

```
sudo zerotier-cli join <network id>
```

Enter Zero Tier config directory, for different operating systems, see <https://docs.zerotier.com/zerotier/zerotier.conf/>{:target="_blank"}.

```
cd /var/lib/zerotier-one
```

Create world definition file

```
sudo zerotier-idtool initmoon identity.public >> moon.json
```

Add cloud server public IP address and port 9993 (the default port Zero Tier uses) to `stableEndpoints` in `moon.json`, for example, `"stableEndpoints": ["10.10.10.10/9993"]`


Generate moon sign file

```
sudo zerotier-idtool genmoon moon.json
```

Move the sign file written `000000xxxxxx.moon` to `<zero tier config dir>/moons.d/` (create this folder if it does not exist).

Add every leaf node that connects to the moon by either

=== "CLI (recommended)"
    ```
    sudo zerotier-cli orbit 000000xxxxxx 000000xxxxxx
    ```
=== "(same as the last step)"

    copying the sign file `000000xxxxxx.moon` to the Zero Tier config directory on that machine


Restart Zero Tier service, see <https://docs.zerotier.com/zerotier/troubleshooting/#error-cannot-connect-to-zerotier-service-or-node-id-unknown-in-the-gui-apps>{:target="_blank"}


Checking:

```
sudo zerotier-cli listmoons
```

should return the content same as in `000000xxxxxx.moon`, where the `id` field is `000000xxxxxx` as above.

```
sudo zerotier-cli peers
```

The moon server should be `MOON` and the machines connecting to it are `LEAF`, and all linked as `DIRECT`. Also, see <https://docs.zerotier.com/zerotier/troubleshooting/#high-latency--relaying>{:target="_blank"}


## Port forwarding

On the remote PC, with elevated privilege:

Add port forwarding

```
netsh interface portproxy add v4tov4 listenaddress=<remote PC IP> listenport=<port> connectaddress=<target server IP> connectport=<target server port>
```

Open the `listenport` in Control Panel > System and Security > Windows Defender Firewall > Advanced Settings > Inbound Rules.

!!! Note ""
    Additionally, to view all rules,

    ```
    netsh interface portproxy show all
    ```

    To delete all rules,

    ```
    netsh interface portproxy reset
    ```
