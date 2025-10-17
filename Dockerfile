FROM debian:trixie-slim

ARG timezone=Europe/London
ARG uid=200

# Set Europe London localtime 

RUN ln -snf /usr/share/zoneinfo/$timezone  /etc/localtime && \
    echo $timezone > /etc/timezone

RUN sed -e 's/set\ -ex/set\  -e/g' -i /opt/entrypoint.sh

ENTRYPOINT [ "/opt/entrypoint.sh" ]

USER ${uid}

