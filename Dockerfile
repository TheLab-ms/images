FROM curlimages/curl:8.1.2 AS builder
WORKDIR /

RUN curl -LO https://github.com/TheLab-ms/thelab-keycloak-theme/releases/download/v0.0.1/makerspace-theme.jar
RUN curl -LO https://github.com/svenstaro/keycloak-http-webhook-provider/releases/download/v1.0.0/keycloak-http-webhook-provider-v1.0.0.jar
RUN curl -LO https://github.com/wadahiro/keycloak-discord/releases/download/v0.4.1/keycloak-discord-0.4.1.jar

FROM scratch
COPY --from=builder / /
