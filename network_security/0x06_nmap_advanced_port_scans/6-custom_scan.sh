#!/bin/bash

# Arguments
host=$1
ports=$2

# Run Nmap custom scan with all TCP flags
sudo nmap --scanflags ALL -p "$ports" -oN custom_scan.txt "$host" > /dev/null 2>&1
