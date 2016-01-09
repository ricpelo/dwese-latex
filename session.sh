#!/bin/bash

P=$PWD

rm $1.tmp 2> /dev/null

while IFS='' read -r line || [[ -n "$line"  ]]; do
    if echo $line | grep "^%"
    then
        line=`echo $line | cut -c2-`
    else
        echo "\$ $line" >> $P/$1.tmp
    fi
    $line >> $P/$1.tmp
done < "$1"

cd $P

rm $1
mv $1.tmp $1

