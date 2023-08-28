#!/bin/bash

: '
    Title: Check the disk usage and send email.
    AUTHOR: Abhishek Tijare
    DATE: 24TH AUGUST, 2023
'
echo "Please provide the limit of disk_usage "
read limit
disk_useage=$(df -h / | awk '{print $5}' | tr -d ' %' | tail -n 1)

function send_mail(){
    curl -s --url 'smtps://smtp.gmail.com:465' --ssl-reqd \
    --mail-from  "$1" \
    --mail-rcpt  "$2" \
    --user "$1" : "$3" \
        -F '=(;type=multipart/mixed' -F "='
            <html><body><p><b>
                    DISK USAGE REPORT 
            </b></p></body></html>
            ';type=text/html" \
        -F "file=@$5;type=application/pdf;encoder=base64"  -F '=)' \
        -H "Subject : $4" \
        -H "From : $1" \
        -H "To : $2" \
}

if [[ "$disk_usage" -gt "$limit" ]];
then
    sub="Disk Usage Alert"
    msg="Disk Usage is above ${limit}%.\nCurrent Disk Usage: ${disk_usage}%."
    echo -e "$msg" > disk_usage_info.txt 
    cupsfilter disk_usage_info.txt > disk_usage_info.pdf
    read -rp "Enter the email of sender " sender
    read -rp "Enter the email of reciever " reciever
    read -rp "Enter the gmail app password " gapp
    read -rp "Enter the subect " sub
    send_email "$sender" "$reciever" "$gapp" "$sub" "disk_usage_info".pdf
    echo "Mail Sent Successfully, please check your mailbox"
else
    echo "disk usage is under limit, do you still want report via mail (Y/N)"
    read choice
    case $choice in
        Y|y)
            sub="Disk Usage Alert"
            msg="Disk Usage is below ${limit}%.\nCurrent Disk Usage: ${disk_usage}%."
            echo -e "$msg" > disk_usage_info.txt 
            cupsfilter disk_usage_info.txt > disk_usage_info.pdf
            read -rp "Enter the email of sender " sender
            read -rp "Enter the email of reciever " reciever
            read -rp "Enter the gmail app password " gapp
            read -rp "Enter the subect " sub
            send_email "$sender" "$reciever" "$gapp" "$sub" "disk_usage_info".pdf 
            echo "Mail Sent Successfully, please check your mailbox"
            ;;
        N|n)
            echo "ok"
            ;;
        *)
            echo "invalid input"
            exit 1
            ;;
    esac
fi
