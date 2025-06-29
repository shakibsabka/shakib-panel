#!/bin/bash

echo "🌐 Installing Shakib Node..."

curl -sSL https://get.docker.com/ | sh
systemctl enable docker
systemctl start docker

dir="/etc/shakib-node"
mkdir -p $dir
curl -L https://github.com/pterodactyl/wings/releases/latest/download/wings_linux_amd64 -o /usr/local/bin/shakib-node
chmod +x /usr/local/bin/shakib-node

cat > $dir/config.yml <<EOL
uuid: YOUR-NODE-UUID
token_id: YOUR-TOKEN-ID
token: YOUR-TOKEN-SECRET
api:
  host: 0.0.0.0
  port: 8080
panel:
  url: https://yourdomain.com
  ssl: true
EOL

echo "✅ Node installed. Edit /etc/shakib-node/config.yml and run:"
echo "shakib-node --config /etc/shakib-node/config.yml"
