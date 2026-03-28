# Stage 1: Pre-build Keycloak
FROM quay.io/keycloak/keycloak:26.5.6 AS builder

RUN /opt/keycloak/bin/kc.sh build

# Stage 2: Final image
FROM quay.io/keycloak/keycloak:26.5.6

# Copy pre-built Keycloak
COPY --from=builder /opt/keycloak/ /opt/keycloak/

# Copy startup script into writable location
COPY start-keycloak.sh /opt/keycloak/start-keycloak.sh

# Set admin credentials
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin

# Expose default port (optional but recommended)
EXPOSE 8080

# Run startup script using bash
ENTRYPOINT ["/bin/bash", "/opt/keycloak/start-keycloak.sh"]