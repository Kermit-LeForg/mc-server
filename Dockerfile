
FROM amazoncorretto:21-alpine 

WORKDIR /app

# curl all jar files for mc server
RUN apk add --no-cache curl

COPY ./ /app/

RUN curl -L https://api.purpurmc.org/v2/purpur/1.20.6/latest/download -o server.jar

EXPOSE 25565

CMD ["sh", "bootstrap.sh"]


