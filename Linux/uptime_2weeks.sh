#!/bin/bash
: '
    Title: Restart if the system is up from 2 weeks .
    AUTHOR: Abhishek Tijare
    DATE: 24TH AUGUST, 2023
'
uptime_sec=$(cut -d " " -f 1 /proc/uptime | awk -F "." '{print $1}')

two_weeks_sec=$((60*60*24*14))

if [ "$uptime_sec" -gt "$two_weeks_sec" ];
    then
    echo "needs to restart ....restarting now "
    sudo reboot
else
    echo "uptime is less than two weeks"
fi
