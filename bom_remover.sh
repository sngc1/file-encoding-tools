#!/bin/sh

DIR=$1

cd $DIR
if [ "$#" -ne 1 ] || ! [ -d "$1" ]; then
  echo "Usage: $0 DIRECTORY" >&2
  exit 1
fi

for file in *.java
do
    echo "Remove BOM from: $file"
    awk 'NR==1{sub(/^\xef\xbb\xbf/,"")}{print}' $file > "${file}.tmp"
    rm $file
    mv "${file}.tmp" $file
done
