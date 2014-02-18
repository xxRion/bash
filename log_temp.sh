#!/bin/bash 
log=/home/rickard/tanktemp.log
when=$(date "+%Y-%m-%d %H:%M:%S")
wget -O q http://nnn.nnn.nu:8083/ZWaveAPI/Run/devices[8].instances[3].commandClasses[49].data[1].val.value > /dev/null 2>&1 
value=$(cat q)
echo "$when $value" >> $log

