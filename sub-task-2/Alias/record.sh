#!/bin/sh

echo -n "Enter the input: "
read VAR
if [[ $VAR = "record1" ]]
then
 cat record_file.txt | grep $(date -dlast-monday "+%Y-%m-%d")
elif [[ $VAR = "record 2" ]]
then
 cat record_file.txt | grep $(date -dlast-tuesday "+%Y-%m-%d")
elif [[ $VAR = "record 3" ]]
then
 cat record_file.txt | grep $(date -dlast-wednesday "+%Y-%m-%d")
elif [[ $VAR = "record 4" ]]
then
 cat record_file.txt | grep $(date -dlast-thursday "+%Y-%m-%d")
elif [[ $VAR = "record 5" ]]
then
 cat record_file.txt | grep $(date -dlast-friday "+%Y-%m-%d")
elif [[ $VAR = "record 6" ]]
then
 cat record_file.txt | grep $(date -dlast-saturday "+%Y-%m-%d")
elif [[ $VAR = "record 7" ]]
then
 cat record_file.txt | grep $(date -dlast-sunday "+%Y-%m-%d")
else
 echo "Invalid input."
fi











