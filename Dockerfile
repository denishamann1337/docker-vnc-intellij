FROM rarspace01/vnc:latest
MAINTAINER rarspace01 <rarspace01 AT gmaiI.com>

#
# System tools
#
RUN apt-get update && \
    apt-get install -y wget software-properties-common openjdk-11-jdk && \
    rm -rf /var/lib/apt/lists/*

#
# Install IDEA CE
#
# From tarball
WORKDIR /tmp
RUN wget -q 'https://download.jetbrains.com/idea/ideaIU-2018.2.tar.gz' && \
    tar xzf ideaIU-2018.2.tar.gz && rm ideaIU-2018.2.tar.gz && \
    mv idea-* /opt/idea && \
    ln -s /opt/idea/bin/idea.sh /usr/local/bin/idea.sh

WORKDIR /

# Add launcher
COPY intellij.desktop /usr/share/applications/intellij.desktop
