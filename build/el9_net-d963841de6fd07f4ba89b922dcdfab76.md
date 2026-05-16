## [Networking](https://docs.oracle.com/en/operating-systems/oracle-linux/9/network/)

### Network Management Tools

#### For Servers Without a GUI
Install and use `NetworkManager-tui` for text-based network configuration:
```bash
sudo dnf install -y NetworkManager-tui
sudo nmtui
```

#### For Servers With a GUI
Install and use `nm-connection-editor` for graphical network configuration:
```bash
sudo dnf install -y nm-connection-editor
sudo nm-connection-editor
```

Additional command-line tools:
- `nmcli`
- `ip`
- `ethtool`
- `ifconfig`


#### Cockpit
Consider using Cockpit for web-based server management.

---

## [Configuring VPNs](https://docs.oracle.com/en/operating-systems/oracle-linux/vpn/)
For Production purposes, Libreswan is the recommended option \
WireGuard: https://www.wireguard.com \
Libreswan: https://libreswan.org 

---

## [High Availability Clustering]()
### Install Required Packages
Enable necessary repositories and install HA packages:
```bash
$ sudo dnf config-manager --enable ol9_appstream ol9_baseos_latest ol9_addons
$ sudo dnf install pcs pacemaker resource-agents fence-agents-all
```

### Configure Firewall
If `firewalld` is running, add the HA service to each node. A script can be used to auto-check `firewalld` status before proceeding.

#### Required Ports
- **TCP Ports**:
    - `2224` (pcs daemon)
    - `3121` (Pacemaker Remote nodes)
    - `21064` (DLM resources)
- **UDP Ports**:
    - `5405` (Corosync clustering)
    - `5404` (Corosync multicast, if configured)

Add the HA service to the firewall:
```bash
$ sudo firewall-cmd --permanent --add-service=high-availability
$ sudo firewall-cmd --add-service=high-availability
```

### Enable and Start Services
Set a password for the `hacluster` user and enable the `pcsd` service:
```bash
$ sudo passwd hacluster
$ sudo systemctl enable --now pcsd.service
```

---

## [Load Balancing](https://docs.oracle.com/en/operating-systems/oracle-linux/9/balancing/index.html#documentation-license)

### High Availability (HA) Load Balancing
HA Load Balancing can be achieved using tools like:
- **HAProxy**: Round Robin
- **Keepalived**: NAT
- **NGINX**: Round Robin (RR), Weighted Round Robin (WRR), Least Connections Load Balancing (LCLB)

### Installation
On each front-end server, install the required packages:
```bash
sudo dnf install -y haproxy keepalived
```

### Configuration
Edit the configuration files for each server:
- `/etc/haproxy/haproxy.cfg`
- `/etc/keepalived/keepalived.conf`

### Enable HAProxy to Handle Port 80
Allow traffic on port 80 using `firewall-cmd`:
```bash
sudo firewall-cmd --zone=zone --add-port=80/tcp
# Or for a permanent rule:
sudo firewall-cmd --permanent --zone=zone --add-port=80/tcp
```

### Start and Enable HAProxy
Enable and start the HAProxy service:
```bash
sudo systemctl enable --now haproxy
```

### Enable IP Forwarding
Modify `/etc/sysctl.conf` to enable IP forwarding:
```bash
net.ipv4.ip_forward = 1
```

Verify that IP forwarding is enabled:
```bash
sudo sysctl -p
# Or
net.ipv4.ip_forward = 1
```
