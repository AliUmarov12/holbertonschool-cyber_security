#!/bin/bash
#!/bin/bash
ps -u "$1" -o pid,user,pcpu,pmem,vsz,rss,tty,stat,start,time,cmd | grep -v ' 0.0  0 '
