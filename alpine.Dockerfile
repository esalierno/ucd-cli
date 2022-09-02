FROM alpine:latest

ARG ucd_version
LABEL ucd_version=${ucd_version}

COPY udclient-${ucd_version}.zip /tmp
RUN apk add --no-cache unzip openjdk11-jre-headless

RUN unzip /tmp/udclient-${ucd_version}.zip -d /tmp \
    && mv /tmp/udclient /usr/local \
    && rm -fr /tmp/udclient-${ucd_version}.zip

ENV PATH=/usr/local/udclient:$PATH
ENV JAVA_HOME=/usr/lib/jvm/default-jvm

ENTRYPOINT ["udclient"]
