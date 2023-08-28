#!/bin/bash

: '
    Title: Check the CPU usage.
    AUTHOR: Abhishek Tijare
    DATE: 24TH AUGUST, 2023
'
function cpu_stats {
echo "-------------------------------------------" >> "$1".txt
echo "-----------------CPU USAGE-----------------" >> "$1".txt
echo "-------------------------------------------" >> "$1".txt
ps -eocomm,pcpu | grep -E -v '(0.0)|(%CPU)' >> "$1".txt
}
