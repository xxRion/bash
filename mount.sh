#!/bin/sh
if [ -d /root/myPc/Users ]; then
    echo "/root/myPc already mounted"
else
    echo -n Password MyFirstAD:
    read -s dspwd
    echo
    mount -t cifs -o username=myUID,password=$dspwd,workgroup=workgroup //10.3.75.42/c$ /root/myPc
fi

if [ -d /root/h-kolon/Documents ]; then
    echo "/root/h-kolon already mounted"
else
    if [[ -z $dspwd ]]; then
        echo -n "Password MyFirstAD:"
        read -s dspwd
        echo
    fi
    mount -t cifs -o username=myUID,password=$dspwd,workgroup=workgroup //10.3.75.43/myUID$ /root/h-kolon
    hostname -i > /root/h-kolon/linux-rion.txt
fi

if [ -d /root/g-kolon/SAAB ]; then
    echo "/root/g-kolon already mounted"
else
    if [[ -z $dspwd ]]; then
        echo -n "Password MyFirstAD:"
        read -s dspwd
        echo
    fi
    mount -t cifs -o username=myUID,password=$dspwd,workgroup=workgroup //10.3.75.43/CN /root/g-kolon/
fi


if [ -d /root/myAppServer/AppData ]; then
    echo "/root/myAppServer already mounted"
else
    echo -n "Password MyOtherAD:"
    read -s pwd
    echo
    mount -t cifs -o username=myUID,password=$pwd,workgroup=corp //myAppServer.corp.saab.se/c$/Users/myUID /root/myAppServer/
fi

mount | grep "^//"|cut -d ' ' -f 3

