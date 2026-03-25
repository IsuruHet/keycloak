# Use Keycloak image as base
FROM quay.io/keycloak/keycloak:26.5.6

# Set environment variables for admin credentials
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin

# Expose port 8080
EXPOSE 8080

# Run Keycloak in development mode
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]