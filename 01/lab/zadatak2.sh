#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Neispravni argumenti"
    echo "Argumenti moraju: [puniPutDoKazala] [periodUDanima]"
    echo "Primjer koristenja: ./zadatak2.sh ~ 8"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Prvi argument mora biti put do kazala!"
    echo "Argumenti moraju: [puniPutDoKazala] [periodUDanima]"
    echo "Primjer koristenja: ./zadatak2.sh ~ 8"
    exit 1
fi

kazalo=$1
period="-${2}"

for file in `find "$kazalo" -mtime $period` ; do
    if [ -d $file ]; then
        continue
    fi
    brojRijeci=`wc -w $file | cut -d " " -f 1`
    echo "$file ........ $brojRijeci rijeci"
done