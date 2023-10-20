#!/bin/bash

taglist="$(docker images $1 | awk '{print $2}' | sed '1d')"
echo $taglist

temp=0
for tag in $taglist
do 
    createdTime="$(docker inspect -f '{{ .Created }}' $1:$tag)"
    formattedCT=$(date -d "$createdTime" +'%Y%m%d%H%M%S')
    if [ $temp -eq 0 ]; then
        greatestValue=$formattedCT
        temp=1
    fi
    if [ $formattedCT -ge $greatestValue ]; then
        greatestValue=$formattedCT
        latestTag=$tag
    fi
done

echo "greatesvalue:"  $greatestValue
echo "latest-tag:" $latestTag
image="$(docker images ramalaxmi/myimage:$latestTag | awk '{print $2}' | sed '1d')"
echo $image
