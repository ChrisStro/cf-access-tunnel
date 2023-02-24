#!/bin/bash
apt update -y && apt upgrade -y
echo "Install curl to downloading cloudflared"
apt install curl -y
echo "Install net-tools, needed for HEALTHCHECK"
apt install net-tools
curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
dpkg -i cloudflared.deb