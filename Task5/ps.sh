#!/bin/bash

readarray -t dirs < <(find /proc -maxdepth 1 -type d -name "*[0-9]*" -printf '%P\n')

echo "PID" "STAT" "EXEC    " "TIME  " "COMMAND"  

for i in "${dirs[@]}"
do
   if [ -d /proc/$i ]; then	
    echo "$i" "$(awk '{printf("%5s %5s\n",$3,$2)}' /proc/$i/stat | sed -e 's/(/\[/' -e 's/)/\]/')" "$(awk '{print $22}' /proc/$i/stat)" "$(awk '{print}' /proc/$i/cmdline)"
   fi
done


