#!/bin/bash
sudo nmap --scanflags ALL -p $PORTS $TARGET > custom_scan.txt 2>&1
