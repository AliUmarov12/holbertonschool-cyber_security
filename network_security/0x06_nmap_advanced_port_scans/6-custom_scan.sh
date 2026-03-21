#!/bin/bash
sudo nmap --scanflags URGACKPSHRSTSYNFIN -p $PORTS -oN custom_scan.txt $TARGET > /dev/null 2>&1
