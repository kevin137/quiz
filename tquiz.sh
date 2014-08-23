#!/bin/sh
wc -l $1
TS=`date '+%Y-%m-%d-%H-%M-%S'`; 
script -c "quiz -t -i ind $1 ans" -t$TS.tim $TS.xsc; 
echo \#\#\# transcript > $TS.txt ; cat $TS.xsc >> $TS.txt ; 
echo \#\#\# timing >> $TS.txt ; cat $TS.tim >> $TS.txt; 
rm $TS.xsc $TS.tim
