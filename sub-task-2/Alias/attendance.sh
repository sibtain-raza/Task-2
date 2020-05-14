#!/bin/sh
touch /home/ArmyGeneral/attendance_record.txt
echo "Soldiers who were Present" > /home/ArmyGeneral/attendance_record.txt
touch /home/NavyMarshal/attendance_record.txt
echo "Soldiers who were Present " > /home/NavyMarshal/attendance_record.txt
touch /home/AirforceCheif/attendance_record.txt
echo "Soldiers who were Present " > /home/AirforceCheif/attendance_record.txt

for i in {1..50}
do
cat attendance.log | grep $(date +"%Y-%m-%d") | grep "\bArmy$i\b" | grep YES >> /home/ArmyGeneral/attendance_record.txt
cat attendance.log | grep $(date +"%Y-%m-%d") | grep "\bNavy$i\b" | grep YES >> /home/NavyMarshal/attendance_record.txt
cat attendance.log | grep $(date +"%Y-%m-%d") | grep "\bAirForce$i\b" | grep YES >> /home/AirforceCheif/attendance_record.txt
done

touch /home/ArmyGeneral/record_file.txt
touch /home/NavyMarshal/record_file.txt
touch /home/AirforceCheif/record_file.txt

for i in {1..50}
do
cat attendance.log | grep $(date +"%Y-%m-%d") | grep "\bArmy$i\b" | grep YES >> /home/ArmyGeneral/record_file.txt
cat attendance.log | grep $(date +"%Y-%m-%d") | grep "\bNavy$i\b" | grep YES >> /home/NavyMarshal/record_file.txt
cat attendance.log | grep $(date +"%Y-%m-%d") | grep "\bAirForce$i\b" | grep YES >> /home/AirforceCheif/record_file.txt
done |
echo "$(crontab -l ; echo  '0 6 * * * bash /home/sibtain/attendance.sh')" | crontab -
