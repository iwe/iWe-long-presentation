FROM registry.fedoraproject.org/fedora:latest

RUN dnf -y --setopt=tsflags=nodocs install texlive-scheme-full rubber && \
    dnf clean all
