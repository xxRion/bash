#!/bin/bash
#Leta upp alla JPG och NEF filer och flytta dem till
#katalogstruktur datum-baserat
#
cd /usr/local/bin/

jpgdir=/c/bilder
nefdir=/c/bilder/nef
tmpdir=/c/bilder/arbetskatalog

find $jpgdir/tmp -iname "*.jpg" -exec  exiv2 mv -F "{}" \;
find $jpgdir/tmp -iname "*.jpg" -exec mv {} $tmpdir \;
   for i in $tmpdir/*.[jJ][pP][gG]; do
      if [ -f "$i" ]; then
        exiv2 mv -F "$i"
        year=$(date +"%Y" -r "$i")
        month=$(date +"%m" -r "$i")
        if [ ! -d "$jpgdir/$year" ]; then
           echo "Skapar katalogen $jpgdir/$year"
           mkdir $jpgdir/$year
        fi
        if [ ! -d "$jpgdir/$year/$month" ] ; then
           echo "Skapar katalogen $jpgdir/$year/$month"
           mkdir $jpgdir/$year/$month
        fi
     mv "$i" $jpgdir/$year/$month
     fi
   done

find $jpgdir/tmp -iname "*.nef" -exec  exiv2 mv -F "{}" \;
find $jpgdir/tmp -iname "*.nef" -exec mv {} $tmpdir \;
   for i in $tmpdir/*.[nN][eE][fF]; do
      if [ -f "$i" ]; then
         exiv2 mv -F $i
         year=$(date +"%Y" -r $i)
         month=$(date +"%m" -r $i)
         if [ ! -d "$nefdir/$year" ]; then
            echo "Skapar katalogen $nefdir/$year"
            mkdir $nefdir/$year
         fi
         if [ ! -d "$nefdir/$year/$month" ] ; then
            echo "Skapar katalogen $nefdir/$year/$month"
            mkdir $nefdir/$year/$month
         fi
      chmod 444 "$i"
      mv "$i" $nefdir/$year/$month
      fi
   done

