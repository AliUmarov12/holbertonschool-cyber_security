#!/bin/bash
sudo nmap --scanflags URGACKPSHRSTSYNFIN -p $2 -oN  $1 > custom_scan.txt 2>&1
