#!/bin/sh

# test-schemas.sh
#
# Test XML XSD files for schema conformity
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


FILELIST=`find ../schemas -type f -name "*.xsd"`

. ./test-functions.sh

VALIDITY=""

while (($#)); do
        if [ "$1" == "--valid" ]; then
		VALIDITY="true"
        fi
        shift
done

#
# Main Block
#

echo "====================================="
echo "Validation Test Suite -- Schema Files"
echo "====================================="
echo ""

START=`date`

if [ ! -z "$VALIDITY" ]; then
        testschemaxmlvalid "$FILELIST"
else
        testschemaxml "$FILELIST"
fi
testtrailingws "$FILELIST"

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

