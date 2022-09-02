FROM redhat/ubi8-minimal:latest

ARG ucd_version
LABEL ucd_version=${ucd_version}

COPY udclient-${ucd_version}.zip /tmp
RUN microdnf -y update \
    && microdnf -y install unzip java-11-openjdk-headless\
    && microdnf clean all \
    && rm -rf /var/cache/yum

RUN unzip /tmp/udclient-${ucd_version}.zip -d /tmp \
    && mv /tmp/udclient /usr/local \
    && rm -fr /tmp/udclient-${ucd_version}.zip

ENV PATH=/usr/local/udclient:$PATH
ENV JAVA_HOME=/etc/alternatives/jre

ENTRYPOINT ["udclient"]
