#!/bin/bash
curl -sS ipv4.icanhazip.com > /usr/bin/.ipvps
REPO="https://raw.githubusercontent.com/Diah082/Ws-Epro/refs/heads/main/"
wget -O /usr/bin/ws "${REPO}ws"
wget -O /usr/bin/config.conf "${REPO}config.conf"
wget -O /etc/systemd/system "${REPO}ws.service"
chmod +x /usr/bin/ws
systemctl daemon-reload
systemctl enable ws.service
systemctl start ws.service
systemctl restart ws.service
