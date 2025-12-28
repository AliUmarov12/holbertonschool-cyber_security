#!/bin/bash
whois "$1" | awk '/^(Registrant|Admin|Tech)/{s=$1} /Name:|Organization:|Street:|City:|State\/Province:|Postal Code:|Country:|Phone:|Fax:|Email:/{gsub(/.*: /,""); k=$0; sub(/ .*/,"",$0); f=$0; if(f=="Street") k=k" "; if(f=="Phone"||f=="Fax") print s" "f","k ORS s" "f" Ext:,"; else print s" "f","k}' > "$1.csv"
