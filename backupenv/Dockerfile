FROM docker.io/rclone/rclone:1.62.2 AS downloader
RUN apk --update add python3 postgresql curl
RUN curl -Lo /usr/local/bin/kubectl "https://dl.k8s.io/release/v1.29.3/bin/linux/amd64/kubectl" && chmod +x /usr/local/bin/kubectl
ENTRYPOINT ["/bin/sh"]
