#!/bin/bash
FOLDER="/home/cam1"
NAME=$(date -d yesterday +"%Y%m%d")

#Create directory and move files
mkdir $FOLDER/$NAME
mv $FOLDER/bilder/ig${NAME}_*.jpg $FOLDER/$NAME

#Create tar-ball for transfer to nasa
tar zcf $FOLDER/$NAME.tgz $FOLDER/$NAME
scp $FOLDER/$NAME.tgz nnn@nnn.nu:/home/nnn/igelosa/cam1

#Remove old files
FILE=$FOLDER/$(date -d "3 days ago" +"%Y%m%d")
if [ -f ${FILE}.tgz ]
  then
    rm -rf ${FILE}*
fi

