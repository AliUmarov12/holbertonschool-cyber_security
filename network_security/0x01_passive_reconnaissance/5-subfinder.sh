#!/bin/bash
subfinder -silent -d $1 | tee >(awk '{ cmd="dig +short "$0; cmd | getline ip; close(cmd); if(ip) print $0","ip }' > "$1.txt")
