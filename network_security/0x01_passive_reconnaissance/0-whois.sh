#!/bin/bash

whois "$1" | awk -F: '
/^(Registrant|Admin|Tech) (Name|Organization|Street|City|State\/Province|Postal Code|Country|Phone):/ {
    field=$1
    value=$2
    gsub(/^ /,"",value)

    if (field ~ /Street/) {
        value = value " "
    }

    print field "," value

    if (field ~ /Phone$/) {
        print field " Ext:,"
    }
}
END {
    printf ""
}
' > "$1.csv"
