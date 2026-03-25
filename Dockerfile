FROM quay.io/keycloak/keycloak:26.5.6 AS builder

ENV KC_DB=dev-file
ENV KC_HTTP_ENABLED=true
ENV KC_HOSTNAME_STRICT=false

# Pre-build Keycloak to avoid runtime augmentation
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:26.5.6

COPY --from=builder /opt/keycloak/ /opt/keycloak/

ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin
ENV KC_HTTP_HOST=0.0.0.0
ENV KC_HTTP_PORT=8080
ENV KC_HTTP_ENABLED=true
ENV KC_HOSTNAME_STRICT=false
ENV KC_PROXY=edge
ENV KC_DB=dev-file

EXPOSE 8080

# Use start instead of start-dev since we pre-built
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized"]