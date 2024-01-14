FROM curlimages/curl:8.1.2 AS downloader
WORKDIR /tmp
RUN curl -LO https://github.com/TheLab-ms/thelab-keycloak-theme/releases/download/v0.0.1/makerspace-theme.jar
RUN curl -LO https://github.com/wadahiro/keycloak-discord/releases/download/v0.4.1/keycloak-discord-0.4.1.jar

# just add this image so we can pull jars out of it
FROM quay.io/phasetwo/phasetwo-keycloak:23.0.4 as ptkc
RUN ls /opt/keycloak/providers && cp -rv /opt/keycloak/providers/*magic-link* /tmp/magic-link.jar && cp -rv /opt/keycloak/providers/*events*.jar /tmp/events.jar

FROM quay.io/keycloak/keycloak:23.0.4 AS kc
ENV KC_DB=postgres
ENV KC_FEATURES=declarative-user-profile,client-secret-rotation
COPY --from=downloader /tmp /opt/keycloak/providers
COPY --from=ptkc /tmp/events.jar /opt/keycloak/providers
COPY --from=ptkc /tmp/magic-link.jar /opt/keycloak/providers
WORKDIR /opt/keycloak
RUN /opt/keycloak/bin/kc.sh build --health-enabled=true

FROM quay.io/keycloak/keycloak:23.0.4
COPY --from=kc /opt/keycloak/ /opt/keycloak/
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
