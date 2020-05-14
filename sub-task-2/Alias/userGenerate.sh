#!bin/sh

useradd -m CheifCommander
useradd -m ArmyGeneral
useradd -m AirforceCheif
useradd -m NavyMarshal
useradd -m sibtain
i=1
while [ $i -le 50 ]
do
useradd -m Army$i 
useradd -m AirForce$i
useradd -m Navy$i
i=$(( $i +1))
done
