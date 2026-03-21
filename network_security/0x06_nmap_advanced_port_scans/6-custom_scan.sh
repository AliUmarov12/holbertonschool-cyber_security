#!/bin/bash
nmap --privileged --scanflags ALL -p $2 -oN custom_scan.txt $1 &> /dev/null
