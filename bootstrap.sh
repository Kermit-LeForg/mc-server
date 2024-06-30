
# install plugins
curl -L https://github.com/ViaVersion/ViaVersion/releases/download/5.0.1/ViaVersion-5.0.1.jar -o ./plugins/ViaVersion-5.0.1.jar

mkdir -p ./world/datapacks
mkdir -p ./world_nether/datapacks
mkdir -p ./world_the_end/datapacks

# install vt 
curl -L https://vanillatweaks.net/download/VanillaTweaks_d135577_UNZIP_ME.zip -o VanillaTweaks.zip
unzip VanillaTweaks.zip -d ./datapacks

# install crafting tweaks
curl -L https://vanillatweaks.net/download/VanillaTweaks_c673968_MC1.21.0.zip -o CraftingTweaks.zip
unzip CraftingTweaks.zip -d ./datapacks

# copy datapacks to all worlds
cp -r ./datapacks/* ./world/datapacks
cp -r ./datapacks/* ./world_nether/datapacks
cp -r ./datapacks/* ./world_the_end/datapacks

# remove zip files
rm VanillaTweaks.zip
rm CraftingTweaks.zip


java -Xms512M -Xmx4096M -Dterminal.jline=false -Dterminal.ansi=true -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:InitiatingHeapOccupancyPercent=15 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar server.jar nogui