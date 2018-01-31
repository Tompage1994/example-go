FROM golang:1.9

WORKDIR /usr/src/app

ENV FIX_DIR /usr/src/app

USER root
RUN chown -R "1001" "${FIX_DIR}" && \
    chgrp -R 0 "${FIX_DIR}" && \
    chmod -R g+rw "${FIX_DIR}" && \
    find "${FIX_DIR}" -type d -exec chmod g+x {} +

USER 1001

COPY *-build /usr/src/app
EXPOSE 8080

CMD ["./*-build"]
