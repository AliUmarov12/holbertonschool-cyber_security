#!/bin/bash
nmap -sV --script=http-vuln-cve2017-5638 "$TARGET" -oN "$OUTPUT"
