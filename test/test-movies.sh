#!/bin/sh

FILELIST=`find ../examples/movies -type f -name "*-bluray*.xml" -o -name "*-dvd*.xml" -o -name "*-ultrahd*.xml"`

for FI in $FILELIST
do
	# xmllint --xinclude --path ../schemas --noout --schema media-schema.xsd $FI --noout
	xmllint --xinclude --noout --schema http://vectortron.com/xml/media/media $FI
done

FILELIST2=`find ../examples/movies -type f -name "*-movie.xml"`

for FI in $FILELIST2
do
	# xmllint --xinclude --path ../schemas --noout --schema vtm-content-movie.xsd $FI --noout
	xmllint --xinclude --noout --schema http://vectortron.com/xml/media/movie $FI
done
