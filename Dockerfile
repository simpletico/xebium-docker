FROM fedora:24
MAINTAINER https://github.com/simpletico

ADD provision.sh /provision.sh

RUN chmod +x /provision.sh

RUN ./provision.sh

EXPOSE 8000
CMD ["mvn", "-Pfitnesse", "-f/Xebium/pom.xml", "test"]
