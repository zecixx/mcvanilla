FROM alpine
MAINTAINER tecrist <kyle@tecrist.com>
RUN addgroup -g 1000 mcuser && \
    adduser -D -u 1000 -G mcuser mcuser
VOLUME /out
RUN apk update && \
        apk add openjdk8 tini
RUN mkdir /minecraft
ADD server.jar /minecraft
WORKDIR /out
USER mcuser
ONBUILD RUN chown -R mcuser:mcuser /out && \
	java -jar /minecraft/server.jar && \ 
	sed -i 's/false/TRUE/ig' /out/eula.txt && \
ENTRYPOINT ["tini","--"]
CMD ["java","-jar","/minecraft/server.jar"]
EXPOSE 25565

