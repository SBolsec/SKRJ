#! /bin/bash

echo "a:"
grep -iE "banana|jabuka|jagoda|dinja|lubenica" namirnice.txt

echo ""
echo "b:"
grep -ivE "banana|jabuka|jagoda|dinja|lubenica" namirnice.txt


echo ""
echo "c:"
grep -rnET "[A-Z]{3}[0-9]{6}" ~/projekti/
