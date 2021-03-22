#! /bin/bash

echo "a:"
grep -iE "banana|jabuka|jagoda|dinja|lubenica" namirnice.txt

echo ""
echo "b:"
grep -ivE "banana|jabuka|jagoda|dinja|lubenica" namirnice.txt


echo ""
echo "c:"
grep -rnET "\b[A-Z]{3}[0-9]{6}\b" ~/projekti/

echo ""
echo "d:"
find . -mtime -14 -mtime 7 -ls

echo ""
echo "e:"
for i in {1..15} ; do echo $i ; done
# for i in $(seq 1 15) ; do echo $i ; done

echo ""
echo "f:"
kraj=15
echo "sekvenca:"
for i in {1..$kraj} ; do echo $i ; done
echo "seq:"
for i in $(seq 1 $kraj) ; do echo $i ; done