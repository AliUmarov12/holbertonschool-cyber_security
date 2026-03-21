#!/bin/bash
sudo nmap --scanflags ALL -p $1 -oN custom_scan.txt $2 > /dev/null 2>&1
