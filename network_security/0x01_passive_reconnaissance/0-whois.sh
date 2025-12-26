#!/bin/bash

whois "$1" | awk '
BEGIN {
    OFS=","
}

/Registrant Name:/ {
    print "Registrant Name",$0 ~ /:/ ? substr($0,index($0,$2)) : ""
}
/Registrant Organization:/ {
    print "Registrant Organization",$0 ~ /:/ ? substr($0,index($0,$3)) : ""
}
/Registrant Street:/ {
    print "Registrant Street",substr($0,index($0,$3))" "
}
/Registrant City:/ {
    print "Registrant City",$0 ~ /:/ ? substr($0,index($0,$3)) : ""
}
/Registrant State\/Province:/ {
    print "Registrant State/Province",$0 ~ /:/ ? substr($0,index($0,$3)) : ""
}
/Registrant Postal Code:/ {
    print "Registrant Postal Code",$0 ~ /:/ ? substr($0,index($0,$4)) : ""
}
/Registrant Country:/ {
    print "Registrant Country",$0 ~ /:/ ? substr($0,index($0,$3)) : ""
}
/Registrant Phone Ext:/ {
    print "Registrant Phone Ext:",""
}

/Admin Name:/ {
    print "Admin Name",$0 ~ /:/ ? substr($0,index($0,$3)) : ""
}
/Admin Organization:/ {
    print "Admin Organization",$0 ~ /:/ ? substr($0,index($0,$3)) : ""
}
/Admin Street:/ {
    print "Admin Street",substr($0,index($0,$3))" "
}
/Admin City:/ {
    print "Admin City",$0 ~ /:/ ? substr($0,index($0,$3)) : ""
}
/Admin State\/Province:/ {
    print "Admin State/Province",$0 ~ /:/ ? substr($0,index($0,$3)) : ""
}
/Admin Postal Code:/ {
    print "Admin Postal Code",$0 ~ /:/ ? substr($0,index($0,$4)) : ""
}
/Admin Country:/ {
    print "Admin Country",$0 ~ /:/ ? substr($0,index($0,$3)) : ""
}
/Admin Phone Ext:/ {
    print "Admin Phone Ext:",""
}

/Tech Name:/ {
    print "Tech Name",$0 ~ /:/ ? substr($0,index($0,$3)) : ""
}
/Tech Organization:/ {
    print "Tech Organization",$0 ~ /:/ ? substr($0,index($0,$3)) : ""
}
/Tech Street:/ {
    print "Tech Street",substr($0,index($0,$3))" "
}
/Tech City:/ {
    print "Tech City",$0 ~ /:/ ? substr($0,index($0,$3)) : ""
}
/Tech State\/Province:/ {
    print "Tech State/Province",$0 ~ /:/ ? substr($0,index($0,$3)) : ""
}
/Tech Postal Code:/ {
    print "Tech Postal Code",$0 ~ /:/ ? substr($0,index($0,$4)) : ""
}
/Tech Country:/ {
    print "Tech Country",$0 ~ /:/ ? substr($0,index($0,$3)) : ""
}
/Tech Phone Ext:/ {
    print "Tech Phone Ext:",""
}
'
