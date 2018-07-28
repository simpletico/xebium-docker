FROM selenium/standalone-firefox-debug
MAINTAINER https://github.com/simpletico

USER root

RUN apt-get update && apt-get install -y apt-utils && apt-get install -y git maven

RUN git clone https://github.com/xebia/Xebium.git

# firefox installation
RUN mkdir /opt/firefox45 && \
    cd /opt/firefox45 && \
    wget https://ftp.mozilla.org/pub/firefox/releases/45.0/linux-x86_64/en-US/firefox-45.0.tar.bz2 && \
    tar -jxvf firefox-45.0.tar.bz2 && \
    cp -r firefox /opt/ && \
    rm /usr/bin/firefox && \
    ln -s /opt/firefox/firefox /usr/bin/firefox

EXPOSE 8000
CMD ["mvn", "-Pfitnesse", "-f/Xebium/pom.xml", "test"]
