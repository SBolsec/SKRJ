#! /bin/bash

if [ "$#" -ne 2 ]; then
  echo "Incorrect number of arguments."
  echo "Usage: ./zadatak5.sh kazalo uzorak"
  exit 1
fi

if [ ! -d "$1" ]; then
  echo "Directory does not exist!"
  exit 1
fi

echo "Kazalo: $1"
echo "Uzorak: $2"

count=`find $1 -name "$2" -print0 | wc -l --files0-from=- | tail -n -1 | cut -d " " -f 1`
echo "Ukupan broj redaka u kazalu $1 s imenima ciji oblik je $2 je ${count}"