#!/bin/bash

echo "================================="
echo " Custom Private DNS Server Setup "
echo "================================="

# Ask user for custom domain name
read -p "Enter your custom domain name (e.g., lonely): " DOMAIN
read -p "Enter your DNS server IP address: " DNS_IP
read -p "Enter your web server IP address for 'www': " WWW_IP
ADMIN_EMAIL="admin.$DOMAIN."

# Update system and install BIND9
echo "[+] Installing BIND9..."
sudo apt update && sudo apt install -y bind9 bind9utils bind9-doc

# Configure BIND9 to use the new domain
echo "[+] Configuring BIND9 for .$DOMAIN..."

# Add zone to named.conf.local
cat <<EOF | sudo tee /etc/bind/named.conf.local
zone "$DOMAIN" {
    type master;
    file "/etc/bind/db.$DOMAIN";
};
EOF

# Create the zone file
cat <<EOF | sudo tee /etc/bind/db.$DOMAIN
\$TTL 86400
@   IN  SOA ns1.$DOMAIN. $ADMIN_EMAIL (
        $(date +%Y%m%d%H) ; Serial
        3600       ; Refresh
        1800       ; Retry
        604800     ; Expire
        86400 )    ; Minimum TTL
@   IN  NS  ns1.$DOMAIN.
ns1 IN  A   $DNS_IP
www IN  A   $WWW_IP
EOF

# Set permissions
sudo chmod 644 /etc/bind/db.$DOMAIN

# Restart BIND9 to apply changes
echo "[+] Restarting BIND9..."
sudo systemctl restart bind9
sudo systemctl enable bind9

echo "[+] DNS setup complete!"
echo "[+] To use .$DOMAIN, set your system's DNS to $DNS_IP"
