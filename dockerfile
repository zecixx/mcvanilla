FROM alpine
MAINTAINER tecrist <kyle@tecrist.com>
RUN addgroup -g 1000 appuser && \
    adduser -r -u 1000 -g mcuser mcuser
USER mcuser
VOLUME /out
RUN apk update && \
        apk add openjdk8 tini
RUN mkdir /minecraft
ADD server.jar /minecraft
WORKDIR /out
RUN java -jar /minecraft/server.jar && \
sed -i 's/false/TRUE/ig' /out/eula.txt

ENTRYPOINT ["tini","--"]
CMD ["java","-jar","/minecraft/server.jar"]
EXPOSE 25565

