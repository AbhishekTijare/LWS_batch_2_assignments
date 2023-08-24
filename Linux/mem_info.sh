#!/bin/bash

: '
    Title: Get free , available and total memory  .
    AUTHOR: Abhishek Tijare
    DATE: 24TH AUGUST, 2023
'
#echo "Total memory"; echo "$(free -h)" | awk 'NR==2{print $2}'
#echo "Free memory"; echo "$(free -h)" | awk 'NR==2{print $4}'
#echo "Available memory"; echo "$(free -h)" | awk 'NR==2{print $7}'

echo "please select what type of info do you require"
echo "1) Total memory"
echo "2) Free memory"
echo "3) Available memory"

read option 

case "$option" in 
    1)
        a="Total Memory"
        b=$(echo "$(free -h)" | awk 'NR==2{print $2}')
        ;;
    2)
        a="Free Memory"
        b=$(echo "$(free -h)" | awk 'NR==2{print $4}')
        ;;
    3)
        a="Available Memory"
        b=$(echo "$(free -h)" | awk 'NR==2{print $7}')
        ;;
    *)
        echo "invalid choice"
        exit 1
        ;;
esac

echo "$a: $b"
