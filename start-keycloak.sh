#!/bin/bash

# Use Render's PORT or default to 8080
PORT=${PORT:-8080}

echo "Starting Keycloak on port $PORT"

# Start Keycloak in dev mode with proper host and port
/opt/keycloak/bin/kc.sh start-dev --http-host 0.0.0.0 --http-port "$PORT"