FROM splunk/splunk:latest

USER root

RUN microdnf update -y && \
    microdnf install -y git sudo && \
    microdnf clean all

RUN echo "splunk ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/splunk && \
    chmod 0440 /etc/sudoers.d/splunk

USER splunk
