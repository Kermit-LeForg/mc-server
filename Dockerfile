
FROM amazoncorretto:21-alpine 

WORKDIR /app

# curl all jar files for mc server
RUN apk add --no-cache curl

COPY ./ /app/

RUN mkdir -p ./datapacks 
RUN mkdir -p ./plugins
RUN mkdir -p ./world
RUN mkdir -p ./world_nether
RUN mkdir -p ./world_the_end

# curl purpur from gh releases
RUN curl -L https://api.purpurmc.org/v2/purpur/1.20.6/latest/download -o server.jar

RUN curl -L https://github.com/ViaVersion/ViaVersion/releases/download/5.0.1/ViaVersion-5.0.1.jar -o ./plugins/ViaVersion-5.0.1.jar


RUN curl -L https://vanillatweaks.net/download/VanillaTweaks_d135577_UNZIP_ME.zip -o VanillaTweaks.zip
RUN unzip VanillaTweaks.zip -d ./datapacks
RUN curl -L https://vanillatweaks.net/download/VanillaTweaks_c673968_MC1.21.0.zip -o CraftingTweaks.zip
RUN unzip CraftingTweaks.zip -d ./datapacks

RUN ln -s /app/datapacks ./world/datapacks
RUN ln -s /app/datapacks ./world_nether/datapacks
RUN ln -s /app/datapacks ./world_the_end/datapacks

RUN rm VanillaTweaks.zip
RUN rm CraftingTweaks.zip


EXPOSE 25565

CMD ["java", "-Xms2G", "-Xmx2G", "-jar", "server.jar", "--nogui"]


