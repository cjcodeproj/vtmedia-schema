#!/bin/sh

FILELIST=`find ../schemas -type f -name "*.xsd"`

for FI in $FILELIST
do
	xmllint --schema http://www.w3.org/2001/XMLSchema.xsd $FI --noout
done
