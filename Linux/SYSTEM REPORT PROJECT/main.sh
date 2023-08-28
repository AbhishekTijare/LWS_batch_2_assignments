#!/bin/bash

: '
    Title: Main file too call functions.
    AUTHOR: Abhishek Tijare
    DATE: 24TH AUGUST, 2023
'
source cpu_usage.sh
source memory_usage.sh
source disk_use.sh
source file_op.sh
source email.sh
count=4
while [[ $count -gt 0 ]]
do
echo "These are the options to choose 
       1) cpu     
       2) mem  
       3) disk
       4) all
       5) exit"

read -rp "Please enter your choice " choice
read -rp "Enter name for the output file " filename

create_file "$filename"
#check_file "$filename"

case $choice in 
    1|cpu|CPU|Cpu)
        cpu_stats "$filename"
        ;;
    2|mem|MEM|memory|MEMORY|Memory|Mem)
        mem_stats "$filename"
        ;;
    3|disk|Disk|DISK)
        disk_stats "$filename"
        ;;
    4|all)
        cpu_stats "$filename"
        mem_stats "$filename"
        disk_stats "$filename"
        ;;
    5|exit|Exit|EXIT)
        exit 0
        ;;
    *)
        echo "invalid input"
        exit 1
        ;;
esac

cupsfilter "$filename".txt > "$filename.pdf"
read -rp "Enter the email of sender " sender
read -rp "Enter the email of reciever " reciever
read -rp "Enter the gmail app password " gapp
read -rp "Enter the subect " sub
send_email "$sender" "$reciever" "$gapp" "$sub" "$filename".pdf
remove_file "$filename".*
count=$((count-1))
echo "$count"
done 
