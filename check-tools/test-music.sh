#!/bin/sh

# test-music.sh
#
# Test XML music files for schema conformity
#


#  Copyright 2024, Chris Josephes
#
#  This work is licensed under the Creative Commons Attribution-ShareAlike
#  4.0 International License.
#
#  To view a copy of this license, visit
#  http://creativecommons.org/licenses/by-sa/4.0/ or
#  send a letter to
#  Creative Commons
#  PO Box 1866
#  Mountain View, CA 94042, USA.


ALBUMFILES=`find ../examples/music -type f -name "*-audiocd.xml" -o -name "*-record.xml"`
ALLXMLFILES=`find ../examples/music -type f -name "*.xml"`

LINTOPTS="--schema http://vectortron.com/xml/media/media"
LISTOK=""

while (($#)); do
	if [ "$1" == "--local" ]; then
		LINTOPTS="--path ../schemas --schema media-schema.xsd"
	elif [ "$1" == "--listok" ]; then
		LISTOK="true"
	fi
	shift
done

. ./test-functions.sh

#
# Main Block
#

echo "===================================="
echo "Validation Test Suite -- Music Files"
echo "===================================="
echo ""

START=`date`

testxmlvalid "$ALBUMFILES"
testtrailingws "$ALLXMLFILES"

END=`date`

echo ""
echo "Test Start Time : $START"
echo "Test End Time   : $END"
echo ""
echo "===================================="
echo "        -- END OF LINE --"
echo "===================================="
echo ""

exit 0
