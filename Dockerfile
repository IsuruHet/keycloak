# Stage 1: Pre-build Keycloak
FROM quay.io/keycloak/keycloak:26.5.6 AS builder

# Pre-build Keycloak to avoid runtime augmentation
RUN /opt/keycloak/bin/kc.sh build

# Stage 2: Final image
FROM quay.io/keycloak/keycloak:26.5.6

# Copy pre-built Keycloak
COPY --from=builder /opt/keycloak/ /opt/keycloak/

# Copy startup script
COPY start-keycloak.sh /usr/local/bin/start-keycloak.sh
RUN chmod +x /usr/local/bin/start-keycloak.sh

# Set admin credentials via env variables
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin

# Expose default container port
EXPOSE 8080

# Use our startup script
ENTRYPOINT ["/usr/local/bin/start-keycloak.sh"]