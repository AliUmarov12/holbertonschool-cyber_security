#!/bin/bash

whois "$1" | awk -F: '
/Registrant Name:/            {print "Registrant Name," substr($0,index($0,$2))}
/Registrant Organization:/    {print "Registrant Organization," substr($0,index($0,$2))}
/Registrant Street:/          {print "Registrant Street," substr($0,index($0,$2)) " "}
/Registrant City:/            {print "Registrant City," substr($0,index($0,$2))}
/Registrant State\/Province:/ {print "Registrant State/Province," substr($0,index($0,$2))}
/Registrant Postal Code:/     {print "Registrant Postal Code," substr($0,index($0,$2))}
/Registrant Country:/         {print "Registrant Country," substr($0,index($0,$2))}
/Registrant Phone:/           {print "Registrant Phone," substr($0,index($0,$2))}
/Registrant Phone Ext:/       {print "Registrant Phone Ext:,"}
/Registrant Fax:/             {print "Registrant Fax," substr($0,index($0,$2))}
/Registrant Fax Ext:/         {print "Registrant Fax Ext:,"}
/Registrant Email:/           {print "Registrant Email," substr($0,index($0,$2))}

/Admin Name:/                 {print "Admin Name," substr($0,index($0,$2))}
/Admin Organization:/         {print "Admin Organization," substr($0,index($0,$2))}
/Admin Street:/               {print "Admin Street," substr($0,index($0,$2)) " "}
/Admin City:/                 {print "Admin City," substr($0,index($0,$2))}
/Admin State\/Province:/      {print "Admin State/Province," substr($0,index($0,$2))}
/Admin Postal Code:/          {print "Admin Postal Code," substr($0,index($0,$2))}
/Admin Country:/              {print "Admin Country," substr($0,index($0,$2))}
/Admin Phone:/                {print "Admin Phone," substr($0,index($0,$2))}
/Admin Phone Ext:/            {print "Admin Phone Ext:,"}
/Admin Fax:/                  {print "Admin Fax," substr($0,index($0,$2))}
/Admin Fax Ext:/              {print "Admin Fax Ext:,"}
/Admin Email:/                {print "Admin Email," substr($0,index($0,$2))}

/Tech Name:/                  {print "Tech Name," substr($0,index($0,$2))}
/Tech Organization:/          {print "Tech Organization," substr($0,index($0,$2))}
/Tech Street:/                {print "Tech Street," substr($0,index($0,$2)) " "}
/Tech City:/                  {print "Tech City," substr($0,index($0,$2))}
/Tech State\/Province:/       {print "Tech State/Province," substr($0,index($0,$2))}
/Tech Postal Code:/           {print "Tech Postal Code," substr($0,index($0,$2))}
/Tech Country:/               {print "Tech Country," substr($0,index($0,$2))}
/Tech Phone:/                 {print "Tech Phone," substr($0,index($0,$2))}
/Tech Phone Ext:/             {print "Tech Phone Ext:,"}
/Tech Fax:/                   {print "Tech Fax," substr($0,index($0,$2))}
/Tech Fax Ext:/               {print "Tech Fax Ext:,"}
/Tech Email:/                 {print "Tech Email," substr($0,index($0,$2))}
' > "$1.csv"
