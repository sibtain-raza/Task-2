#!/bin/sh
for i in {1..50}
do
touch /home/Army$i/post_alloted.txt
echo " Date               soldier        Post" > /home/Army$i/post_alloted.txt
touch /home/Navy$i/post_alloted.txt
echo " Date               soldier         Post" > /home/Navy$i/post_alloted.txt
touch /home/AirForce$i/post_alloted.txt
echo " Date               soldier         Post" > /home/AirForce$i/post_alloted.txt
done     
for i in {1..50}
do
cat position.log | grep $(date +"%Y-%m-%d") | grep "\bArmy$i\b" >> /home/Army$i/post_alloted.txt
cat position.log | grep $(date +"%Y-%m-%d") | grep "\bNavy$i\b" >> /home/Navy$i/post_alloted.txt
cat position.log | grep $(date +"%Y-%m-%d") | grep "\bAirForce$i\b" >> /home/AirForce$i/post_alloted.txt
done |
echo "$(crontab -l ; echo  '1 0 * * * bash /home/sibtain/autoschedule.sh')" | crontab -
