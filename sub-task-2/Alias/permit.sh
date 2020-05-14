#!/bin/sh
usermod -a -G CheifCommander sibtain
usermod -a -G AirforceCheif sibtain
usermod -a -G AirforceCheif CheifCommander
usermod -a -G NavyMarshal sibtain
usermod -a -G NavyMarshal CheifCommander
usermod -a -G ArmyGeneral sibtain
usermod -a -G ArmyGeneral CheifCommander


for i in {1..50}
do
usermod -a -G Army$i CheifCommander
usermod -a -G Army$i ArmyGeneral
usermod -a -G Army$i sibtain
usermod -a -G Navy$i CheifCommander
usermod -a -G Navy$i NavyMarshal
usermod -a -G Navy$i sibtain
usermod -a -G AirForce$i CheifCommander
usermod -a -G AirForce$i AirforceCheif
usermod -a -G AirForce$i sibtain
done
chmod 770 /home/sibtain
chmod 770 /home/CheifCommander
chmod 770 /home/AirforceCheif
chmod 770 /home/NavyMarshal
chmod 770 /home/ArmyGeneral

for i in {1..50}
do
chmod 770 /home/Army$i
chmod 770 /home/Navy$i
chmod 770 /home/AirForce$i
done

