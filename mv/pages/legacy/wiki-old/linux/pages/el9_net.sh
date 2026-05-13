# This script is designed to assist with network setup, VPN configuration, and load balancing on EL9 systems.
# It provides options for configuring networking on servers with or without a GUI, setting up VPNs, and enabling load balancing with HAProxy and Keepalived.    
echo "Choose a setup option:"
echo "1) Configure VPN"
echo "2) HA Clustering"
echo "3) Load Balancing"
read -p "Enter your choice (1-3): " choice

case $choice in
    1)
        echo "Configure VPN selected."
        echo "Choose a VPN option:"
        echo "1) WireGuard"
        echo "2) Libreswan"
        read -p "Enter your choice (1-2): " vpn_choice
        if [ "$vpn_choice" -eq 1 ]; then
            echo "Installing WireGuard..."
            sudo dnf install -y wireguard-tools
            echo "Generating WireGuard keys..."
            private_key=$(wg genkey)
            public_key=$(echo "$private_key" | wg pubkey)
            echo "Private Key: $private_key"
            echo "Public Key: $public_key"
            echo "Creating /etc/wireguard/wg0.conf..."
            sudo bash -c 'cat > /etc/wireguard/wg0.conf <<EOF
    [Interface]
    PrivateKey = $private_key
    Address = 10.0.0.1/24
    ListenPort = 51820

    [Peer]
    PublicKey = <peer_public_key>
    AllowedIPs = 10.0.0.2/32
    Endpoint = <peer_endpoint>:51820
    EOF'
            echo "Adjusting permissions for /etc/wireguard/wg0.conf..."
            sudo chmod 600 /etc/wireguard/wg0.conf
            echo "Enabling IP forwarding..."
            sudo sed -i '/net.ipv4.ip_forward/s/^#//g' /etc/sysctl.conf
            sudo sysctl -p
            echo "Starting WireGuard interface..."
            sudo wg-quick up wg0
            echo "Enabling WireGuard to start on boot..."
            sudo systemctl enable wg-quick@wg0
            echo "Checking if UDP port 51820 is open..."
            if sudo firewall-cmd --list-ports | grep -q "51820/udp"; then
                echo "UDP port 51820 is already open."
            else
                echo "Opening UDP port 51820..."
                sudo firewall-cmd --zone=public --add-port=51820/udp
                sudo firewall-cmd --permanent --zone=public --add-port=51820/udp
                echo "UDP port 51820 has been opened."
            fi
            echo "WireGuard setup complete."
        elif [ "$vpn_choice" -eq 2 ]; then
            echo "Installing Libreswan..."
            sudo dnf install -y libreswan
            echo "Configuring Libreswan..."
            echo "Creating /etc/ipsec.d/myvpn.conf..."
            sudo bash -c 'cat > /etc/ipsec.d/myvpn.conf <<EOF
    conn myvpn
        authby=secret
        auto=start
        left=%defaultroute
        leftid=@yourdomain.com
        leftsubnet=192.168.1.0/24
        right=remote.vpn.server
        rightid=@remote.vpn.server
        rightsubnet=10.0.0.0/24
        ike=aes256-sha2;modp1024
        phase2alg=aes256-sha2;modp1024
    EOF'
            echo "Creating /etc/ipsec.d/myvpn.secrets..."
            sudo bash -c 'cat > /etc/ipsec.d/myvpn.secrets <<EOF
    @yourdomain.com @remote.vpn.server : PSK "your_pre_shared_key"
    EOF'
            echo "Restarting IPsec service..."
            sudo systemctl restart ipsec
            echo "Enabling IPsec service on boot..."
            sudo systemctl enable ipsec

             echo "Checking if UDP ports 500 and 4500 are open..."
            if sudo firewall-cmd --list-ports | grep -q "500/udp,4500/udp"; then
                echo "UDP ports 500 and 4500 are already open."
            else
                echo "Opening UDP ports 500 and 4500..."
                sudo firewall-cmd --zone=public --add-port=500/udp --add-port=4500/udp
                sudo firewall-cmd --permanent --zone=public --add-port=51820/udp --add-port=4500/udp
                echo "UDP ports 500 and 4500 have been opened."
            fi
            echo "Libreswan setup complete."
        ;;
    2) echo "High Availability Clustering selected."
    Before continuing, would you like to set up High Availability (HA) Clustering? This setup involves configuring Corosync and Pacemaker.

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
        ;;
    3)
        echo "Load Balancing selected."
        echo "Installing HAProxy and Keepalived..."
        sudo dnf install -y haproxy keepalived
        echo "Configuring HAProxy and Keepalived..."
        echo "Edit the following configuration files as needed:"
        echo "- /etc/haproxy/haproxy.cfg"
        echo "- /etc/keepalived/keepalived.conf"
        echo "1) Edit /etc/haproxy/haproxy.cfg"
        echo "2) Edit /etc/keepalived/keepalived.conf"
        echo "3) Continue"
        read -p "Enter your choice (1-3): " config_choice
        case $config_choice in
            1)
            echo "Opening /etc/haproxy/haproxy.cfg..."
            sudo nano /etc/haproxy/haproxy.cfg
            ;;
            2)
            echo "Opening /etc/keepalived/keepalived.conf..."
            sudo nano /etc/keepalived/keepalived.conf
            ;;
            3*)
            echo "Continuing..."
            ;;
        esac
        echo "Enabling traffic on port 80..."
        sudo firewall-cmd --zone=zone --add-port=80/tcp
        sudo firewall-cmd --permanent --zone=zone --add-port=80/tcp
        echo "Starting and enabling HAProxy..."
        sudo systemctl enable --now haproxy
        echo "Enabling IP forwarding..."
        sudo sed -i '/net.ipv4.ip_forward/s/^#//g' /etc/sysctl.conf
        sudo sysctl -p
        ;;
    *)
        echo "Invalid choice. Exiting."
        ;;
esac

