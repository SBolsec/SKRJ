#! /bin/bash

if [ "$#" -ne 1 ]; then
  echo "Incorrect number of arguments."
  echo "Usage: ./zadatak4.sh directory"
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

for date in `ls $dir | grep -oE '[0-9]{6}' | sort -u`
do
  year=`echo $date | cut -c1-4`
  month=`echo $date | cut -c5-6`

  echo "${month}-${year} :"
  echo "----------"

  i=0
  for file in `ls $dir | grep "^${date}"`
  do
    printf "%4d. %s\n" $((i+1)) $file
    i=$((i+1))
  done

  echo "--- Ukupno: $i slika ---"
  echo ""
done