#/bin/sh
jcommand = "java -jar /minecraft/server.jar"
if [ -f "/out/eula.txt"]; then
   $jcommand
else
   $jcommand && sed -i 's/false/TRUE/ig' /out/eula.txt && $jcommand 
fi
