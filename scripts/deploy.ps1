#!/bin/bash
set -e

echo "📦 Deploying COBOL application…"

if [ -z "$NEXUS_USER" ] || [ -z "$NEXUS_PASS" ] || [ -z "$NEXUS_IP" ]; then
  echo "❌ Missing Nexus credentials (NEXUS_USER / NEXUS_PASS / NEXUS_IP)"
  exit 1
fi

mkdir -p /opt/cobol-app/

echo "⬇️ Downloading latest binary from Nexus…"
curl -u "$NEXUS_USER:$NEXUS_PASS" \
     -o /opt/cobol-app/cobol-app \
     "http://$NEXUS_IP:8081/repository/cobol-release/cobol-app"

chmod +x /opt/cobol-app/cobol-app

echo "🔄 Restarting COBOL service…"
sudo systemctl restart cobol-app

echo "📗 Deployment completed"
