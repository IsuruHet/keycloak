# Stage 2: Final image
FROM quay.io/keycloak/keycloak:26.5.6

# Copy pre-built Keycloak
COPY --from=builder /opt/keycloak/ /opt/keycloak/

# Copy startup script into writable location
COPY start-keycloak.sh /opt/keycloak/start-keycloak.sh

# Set admin credentials via env variables
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin

# Expose port
EXPOSE 8080

# Use bash to run the script
ENTRYPOINT ["/bin/bash", "/opt/keycloak/start-keycloak.sh"]