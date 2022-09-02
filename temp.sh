#!/bin/bash
x=1
while [ $x -le 5 ]
do  
    now=$(date)
    file=$(date +"%Y-%m-%d_%H")."result.txt"
    # echo $file
    echo -n "$now | " >> $file
    ping -qc1 google.com 2>&1 | awk -F'/' 'END{ print (/^rtt/? ""$5" ms":"FAIL") }' >> $file
    sleep 1
done