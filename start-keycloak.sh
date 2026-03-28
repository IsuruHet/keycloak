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
  --https-key-store-file="" \
  --https-key-store-password=""