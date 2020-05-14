#!/bin/sh
touch /home/CheifCommander/attendance_report.txt
echo "Date                            soldier    attendence" >> /home/CheifCommander/attendance_report.txt
for i in {1..50}
do
cat attendance.log | grep $(date +"%Y-%m-%d") | grep "\bArmy$i\b" | grep YES >> /home/CheifCommander/attendance_report.txt
cat attendance.log | grep $(date +"%Y-%m-%d") | grep "\bNavy$i\b" | grep YES >> /home/CheifCommander/attendance_report.txt
cat attendance.log | grep $(date +"%Y-%m-%d") | grep "\bAirForce$i\b" | grep YES >> /home/CheifCommander/attendance_report.txt
done
