#!/bin/bash
# This script ensures Keycloak listens on the port Render assigns

# Render automatically sets PORT environment variable
PORT=${PORT:-8080}   # Default to 8080 if PORT is not set

# Start Keycloak in dev mode with proper host and port
/opt/keycloak/bin/kc.sh start-dev --http-port "$PORT" --http-host 0.0.0.0