#!/bin/bash
#Starta 2 virtuella xp
VBoxManage startvm Photoshop --type headless
VBoxManage startvm Elements --type headless

# VBoxManage controlvm Photoshop acpipowerbutton
# VBoxManage controlvm Elements savestate

#for i in Photoshop Elements; do VBoxManage controlvm $i savestate; done
#for i in Photoshop Elements; do VBoxManage startvm $i --type headless; done

