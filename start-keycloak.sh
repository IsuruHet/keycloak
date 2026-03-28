#!/bin/bash
# Read Render's PORT or default to 10000
PORT=${PORT:-10000}

# Your Render public hostname
HOSTNAME=${KC_HOSTNAME:-keycloak-9zee.onrender.com}

echo "Starting Keycloak in production mode"
echo "Binding to 0.0.0.0:$PORT with hostname $HOSTNAME"

# Production start with:
# - host/port binding
# - hostname
# - hostname-strict=false to allow Render proxy
# - http enabled (HTTPS handled by Render)
exec /opt/keycloak/bin/kc.sh start \
  --http-port="$PORT" \
  --http-host=0.0.0.0 \
  --hostname="$HOSTNAME" \
  --hostname-strict=false \
  --http-enabled=true \
  --proxy-headers=xforwarded
