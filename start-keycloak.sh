#!/bin/bash
PORT=${PORT:-10000}
HOSTNAME=${KC_HOSTNAME:-keycloak-9zee.onrender.com}

# Cap JVM heap to fit within Render's memory limit
export JAVA_OPTS_APPEND="-Xms64m -Xmx320m -XX:MetaspaceSize=96m -XX:MaxMetaspaceSize=256m"

echo "Starting Keycloak in production mode"
echo "Binding to 0.0.0.0:$PORT with hostname $HOSTNAME"

exec /opt/keycloak/bin/kc.sh start \
  --http-port="$PORT" \
  --http-host=0.0.0.0 \
  --hostname="$HOSTNAME" \
  --hostname-strict=false \
  --http-enabled=true \
  --proxy-headers=xforwarded \
  --cache=local