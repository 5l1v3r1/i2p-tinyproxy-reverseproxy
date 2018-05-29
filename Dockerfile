FROM alpine:3.7
ARG CUSER
RUN apk update
RUN apk add tinyproxy
RUN echo
RUN echo $CUSER
RUN adduser -h /home/${CUSER} -g ',,,,' -s /bin/sh -D ${CUSER}
USER $CUSER
WORKDIR /home/$CUSER
COPY etc/tinyproxy/tinyproxy.conf ./tinyproxy.conf
CMD tinyproxy -c ./tinyproxy.conf -d
