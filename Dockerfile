FROM ubuntu:24.04

RUN apt-get update && \
    apt-get -y install libpng16-16 fontconfig adduser cpio tzdata \
               findutils nano \
               libcap2-bin openssl openssh-client inotify-tools procps \
               libxcb-shm0 libxcb-render0 libxrender1 libxext6 \
               fonts-wqy-zenhei fonts-wqy-microhei fonts-droid-fallback \
               fonts-noto-cjk ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY wopi.AppImage .

RUN adduser --quiet --system --group --home /opt/cool cool && \
	mkdir /docs && \
	chown -R cool:cool /app /docs

EXPOSE 9983

USER cool


ENTRYPOINT ["/app/wopi.AppImage","--appimage-extract-and-run"]