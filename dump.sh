#!/bin/bash

file=$1
filename=${file%.*}
$(mkdir $filename)

#getting streams
streams=$(oledump.py $file | grep -i ': m' | cut -d: -f1)
for stream in $streams; do
	oledump.py $file -s $stream -v > ${filename}/s$stream
done

#getting objects
objects=$(oledump.py $file | grep -i ': o' | cut -d: -f1)
for object in $objects; do
	oledump.py $file -s $object -e > ${filename}/o$object
done

echo "'$file' extracted successfully"
