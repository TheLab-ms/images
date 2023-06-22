FROM curlimages/curl:8.1.2 AS builder
WORKDIR /tmp

RUN curl -LO https://github.com/TheLab-ms/thelab-keycloak-theme/releases/download/v0.0.1/makerspace-theme.jar
RUN curl -LO https://github.com/wadahiro/keycloak-discord/releases/download/v0.4.1/keycloak-discord-0.4.1.jar
RUN curl -LO https://github.com/softwarefactory-project/keycloak-github-ssh-key-attribute-mapper/releases/download/1.0.0/github-ssh-mapper-1.0.0.jar

FROM alpine:latest
COPY --from=builder /tmp /opt/keycloak/providers
VOLUME /opt/keycloak/providers
CMD ["sleep", "infinity"]

