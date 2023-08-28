#!/bin/bash

: '
    Title: Check the memory usage.
    AUTHOR: Abhishek Tijare
    DATE: 24TH AUGUST, 2023
'
function mem_stats {
echo "-------------------------------------------" >> "$1".txt
echo "-------------MEMORY- USAGE-----------------" >> "$1".txt
echo "-------------------------------------------" >> "$1".txt
ps -eocomm,pmem | grep -E -v '(0.0)|(%MEM)' >> "$1".txt
}
