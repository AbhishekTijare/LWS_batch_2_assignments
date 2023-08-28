#!/bin/bash

: '
    Title: Check the disk usage.
    AUTHOR: Abhishek Tijare
    DATE: 24TH AUGUST, 2023
'
function disk_stats {
echo "-------------------------------------------" >> "$1".txt
echo "-----------------Disk USAGE-----------------" >> "$1".txt
echo "-------------------------------------------" >> "$1".txt
df -h | awk '{print $1"  " $5}' >> "$1".txt
}
