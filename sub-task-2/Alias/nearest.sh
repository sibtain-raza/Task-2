#!/bin/sh
touch 1.txt
echo " " > 1.txt
for i in {1..50}
do
cat position.log | grep $(date +"%Y-%m-%d") >> 1.txt
done
touch 2.txt 
awk '
     BEGIN {while ((getline < "1.txt") >0) {rec[$2]=$0}}
     {print rec[$2]}' < /home/CheifCommander/attendance_report.txt > 2.txt |
touch 3.txt
awk '
function abs(value)
{
if(value < 0)
return value*-1
else 
return value
}

function acosd(x)
{return atan2(sqrt(1-x*x),x)}
 
  {  if(NR < 10) 
     array[""]=0; 
      
       X1 = substr($4,4,6) 
       Y1 = substr($3,4,6)
       
       X2 = 77.1025
       Y2 = 28.7041
       lat1 = Y1/57.29
       long1 = X1/57.29
       lat2 = Y2/57.29
       long2 = X2/57.29
     
       
       
       d = 6378.137*acosd((sin(lat1)*sin(lat2))+cos(lat1)*cos(lat2)*cos(long2-long1))
   
  


array[d" "] = ($2" "$1)
   
}
END{
          
  for (i in array){
   print i,array[i];
}
}
 ' 2.txt|sort -n >3.txt |
touch 4.txt

awk 'FNR <= 11' 3.txt > 4.txt |
touch /home/CheifCommander/nearest10.txt
echo "soldier    date" > /home/CheifCommander/nearest10.txt
awk '{print $2,$3}' 4.txt >> /home/CheifCommander/nearest10.txt
 
rm 1.txt 2.txt 3.txt 4.txt


