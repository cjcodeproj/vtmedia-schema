#!/bin/sh

# test-music.sh
#
# Test XML music files for schema conformity
#

ALBUMFILES=`find ../examples/music -type f -name "*-audiocd.xml"`
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

#
# Test for schema validation
#

testxmlvalid()
{
	echo "Test: XML Validity Against Schema"
	echo "---------------------------------"
	ACOUNT=0
	BCOUNT=0
	XMLBAD=()
	for FI in $ALBUMFILES; do
		ACOUNT=$((ACOUNT +1))
		xmllint --xinclude --noout --quiet --nowarning \
			$LINTOPTS \
			$FI > /dev/null 2>&1
		if [ $? -gt 0 ]; then
			BCOUNT=$((BCOUNT +1))
			XMLBAD++($FI)
		else
			if [ ! -z "$LISTOK" ]; then
				echo `basename $FI`
			fi
		fi
	done
	echo ""
	if [ $BCOUNT -gt 0 ]; then
		for BI in ${XMLBAD[@]}; do
			echo "  Invalid XML File $BI"
		done
		echo ""
	fi
	echo "Files Tested      : $ACOUNT"
	echo "Files With Issues : $BCOUNT"
	echo ""
}

#
# Test for trailing whitespace in XML files
#

testtrailingws()
{
        echo "Test:  Trailing Whitespace"
        echo "--------------------------"
        echo ""
        ACOUNT=0
        BCOUNT=0
        FILEBAD=()
        for FI in $ALLXMLFILES; do
                ACOUNT=$((ACOUNT + 1))
                egrep -q " +$" $FI
                if [ $? -eq 0 ]; then
                        BCOUNT=$((BCOUNT + 1))
                        FILEBAD+=($FI)
                fi
        done
        if [ $BCOUNT -gt 0 ]; then
                for BI in ${FILEBAD[@]}; do
                        echo "  Trailing Whitespace: $BI"
                done
                echo ""
        fi
        echo "Files tested      : $ACOUNT"
	echo "Files With Issues : $BCOUNT"
        echo ""
}


#
# Main Block
#

echo "===================================="
echo "Validation Test Suite -- Music Files"
echo "===================================="
echo ""

START=`date`

testxmlvalid
testtrailingws

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
