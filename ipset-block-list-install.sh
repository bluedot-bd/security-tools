#!/bin/bash

# Create the bad-ip.sh script
cat << 'EOF' > /root/bad-ip.sh
#!/bin/bash
ipset -q flush ipsum
ipset -q create ipsum hash:ip
for ip in $(curl --compressed https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt 2>/dev/null | grep -v "#" | grep -v -E "\s[1-2]$" | cut -f 1); do
    ipset add ipsum $ip
done
iptables -D INPUT -m set --match-set ipsum src -j DROP 2>/dev/null
iptables -I INPUT -m set --match-set ipsum src -j DROP
EOF

# Make the script executable
chmod +x /root/bad-ip.sh

# Install iptables and ipset
apt-get -qq install iptables ipset

# Set up the cron job
(crontab -l 2>/dev/null; echo "0 * * * * sudo bash /root/bad-ip.sh > /root/bad-ip.log") | crontab -

echo "Setup complete."
