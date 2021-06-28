#!/bin/sh

FILELIST=`find ../examples/test -type f -name "*-nothing.xml"`

for FI in $FILELIST
do
	xmllint --xinclude --path ../schemas --noout --schema media-schema.xsd $FI --noout
done
