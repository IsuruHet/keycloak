# Use Keycloak image as base
FROM quay.io/keycloak/keycloak:26.5.6

# Set environment variables for admin credentials
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin

# Explicitly bind to 0.0.0.0 and use Render's PORT env var (defaults to 8080)
ENV KC_HTTP_HOST=0.0.0.0
ENV KC_HTTP_PORT=8080
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false
ENV KC_HTTP_ENABLED=true

# Expose port 8080
EXPOSE 8080

# Run Keycloak in development mode
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]