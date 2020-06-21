#!/bin/bash

DATE=`date +%d-%m-%y`
HOST=10.0.0.202
USER=admin
PASS=DISqzectbumo2468

cd /home/minecraft

zip -r World_Backup-`date +%d-%m-%y`.zip /home/minecraft/world/
zip -r End_World_Backup-`date +%d-%m-%y`.zip /home/minecraft/world_nether/
zip -r Nether_World_Backup-`date +%d-%m-%y`.zip /home/minecraft/world_the_end/

ftp -inv $HOST <<END_SCRIPT
user $USER $PASS
cd General/MCBackup
put World_Backup-`date +%d-%m-%y`.zip
put Nether_World_Backup-`date +%d-%m-%y`.zip
put End_World_Backup-`date +%d-%m-%y`.zip
quit


END_SCRIPT

rm World_Backup-`date +%d-%m-%y`.zip
rm Nether_World_Backup-`date +%d-%m-%y`.zip
rm End_World_Backup-`date +%d-%m-%y`.zip


exit 0

