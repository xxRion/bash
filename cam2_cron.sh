#!/bin/bash
FOLDER="/home/cam2"
NAME=$(date -d yesterday +"%Y%m%d")

#Create tar-ball for transfer to nasa
tar zcf $FOLDER/$NAME.tgz $FOLDER/$NAME
scp $FOLDER/$NAME.tgz rickard@webben.nu:/home/rickard/igelosa/cam2

#Remove old files
FILE=$FOLDER/$(date -d "3 days ago" +"%Y%m%d")
if [ -f ${FILE}.tgz ]
  then
    rm -rf ${FILE}*
fi

