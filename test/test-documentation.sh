#!/bin/sh

FILELIST=`find ../doc -type f -name "*.html"`

for FI in $FILELIST
do
	echo $FI
	xmllint $FI --noout
done
