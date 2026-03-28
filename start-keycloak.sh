#!/bin/bash

# Use Render's PORT or default 8080
PORT=${PORT:-10000}

echo "Starting Keycloak on port $PORT"

# Start Keycloak in dev mode
/opt/keycloak/bin/kc.sh start --http-host 0.0.0.0 --http-port "$PORT"