#!/bin/bash
sudo nmap -scanflags URGACKPSHRSTSYNFIN -p $2 -oN $1
