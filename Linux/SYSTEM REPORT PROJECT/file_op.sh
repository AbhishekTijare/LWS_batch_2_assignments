#!/bin/bash

: '
    Title: File operations.
    AUTHOR: Abhishek Tijare
    DATE: 24TH AUGUST, 2023
'

function create_file {
    touch "$1".txt
}

function check_file {
    ls -al $1
}

function remove_file {
    rm -rf "$1"
}
