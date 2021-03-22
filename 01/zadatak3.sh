#! /bin/bash

if [ "$#" -ne 1 ]; then
  echo "Incorrect number of arguments."
  echo "Usage: ./zadatak3.sh directory"
fi

dir=$1

if [ ! -d $dir ]; then
  echo "Directory does not exist!"
  exit 1
fi

if [ ! -r $dir ]; then
  echo "You do not have read permission!"
  exit 1
fi

for file in `ls $dir | grep -iE '[0-9]{4}-02-[0-9]{2}'`
do
  date=`echo $i | grep -oE '[0-9]{4}-02-[0-9]{2}'`
  
  day=`echo $date | cut -d "-" -f 3`
  month=`echo $date | cut -d "-" -f 2`
  year=`echo $date | cut -d "-" -f 1`
  echo "datum: $day-$month-$year"
  echo "--------------------------------------------------"
  
  cut $dir/$file -d '"' -f 2 | sort | uniq -c | sort -nr
done