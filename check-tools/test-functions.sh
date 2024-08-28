#!/bin/sh

# test-functions.sh
#
# Test XML data files for schema conformity
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
	for FI in $1; do
		ACOUNT=$((ACOUNT +1))
		xmllint --xinclude --noout --quiet --nowarning \
			$LINTOPTS \
			$FI > /dev/null 2>&1
		if [ $? -gt 0 ]; then
			BCOUNT=$((BCOUNT +1))
			XMLBAD+=($FI)
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
# Test for validity, with a single return code
# if problems are detected
#

testxmlvalid_rc()
{
        ACOUNT=0
        BCOUNT=0
	RC=0
        for FI in $1; do
                ACOUNT=$((ACOUNT +1))
                xmllint --xinclude --noout --quiet --nowarning \
                        $LINTOPTS \
                        $FI > /dev/null 2>&1
                if [ $? -gt 0 ]; then
                        BCOUNT=$((BCOUNT +1))
                fi
        done
        if [ $BCOUNT -gt 0 ]; then
		RC=1
        fi
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
        for FI in $1; do
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
# Identify files with trailing whitespace
# but only for the sake of a return code.
#

testtrailingws_rc()
{
        ACOUNT=0
        BCOUNT=0
	RC=0
        for FI in $1; do
                ACOUNT=$((ACOUNT + 1))
                egrep -q " +$" $FI
                if [ $? -eq 0 ]; then
                        BCOUNT=$((BCOUNT + 1))
                fi
        done
        if [ $BCOUNT -gt 0 ]; then
		RC=1
        fi
	return $RC
}

#
# Test the schema files for XML validity
#

testschemaxml()
{
        echo "Test: XSD Well Formed XML"
        echo "-------------------------"
	ACOUNT=0
	BCOUNT=0
	SFFILEBAD=()
	for FI in $1; do
		ACOUNT=$((ACOUNT +1))
        	xmllint $FI --noout
        	if [ $? -gt 0 ]; then
			BCOUNT=$((BCOUNT + 1))
			SFFILEBAD+=($FI)
        	fi
	done
	if [ $BCOUNT -gt 0 ]; then
		for BI in ${SFFILEBAD[@]}; do
			echo "  Invalid XSD file: $BI"
		done
		echo ""
	fi
        echo "Schema Files Tested      : $ACOUNT"
        echo "Schema Files With Issues : $BCOUNT"
        echo ""

}

#
# Test the schema files against the actual schema
#

testschemaxmlvalid()
{
        echo "Test: XSD Schema Validity"
        echo "-------------------------"
        ACOUNT=0
        BCOUNT=0
        SFFILEBAD=()
        for FI in $1; do
                ACOUNT=$((ACOUNT +1))
                xmllint --schema http://www.w3.org/2001/XMLSchema.xsd \
			$FI --noout >/dev/null 2>&1
                if [ $? -gt 0 ]; then
                        BCOUNT=$((BCOUNT + 1))
                        SFFILEBAD+=($FI)
                fi
        done
        if [ $BCOUNT -gt 0 ]; then
                for BI in ${SFFILEBAD[@]}; do
                        echo "  Invalid XSD file: $BI"
                done
                echo ""
        fi
        echo "Schema Files Tested      : $ACOUNT"
        echo "Schema Files With Issues : $BCOUNT"
        echo ""

}

#
# Test schema file validity with return code
#

testschemaxml_rc()
{
        ACOUNT=0
        BCOUNT=0
	RC=0
        for FI in $1; do
                ACOUNT=$((ACOUNT +1))
                xmllint $FI --noout
                if [ $? -gt 0 ]; then
                        BCOUNT=$((BCOUNT + 1))
                fi
        done
        if [ $BCOUNT -gt 0 ]; then
		RC=1
        fi
}

#
# Test schema files against schema with return code
#

testschemaxmlvalid_rc()
{
        ACOUNT=0
        BCOUNT=0
	RC=0
        for FI in $1; do
                ACOUNT=$((ACOUNT +1))
                xmllint --schema http://www.w3.org/2001/XMLSchema.xsd \
                        $FI --noout >/dev/null 2>&1
                if [ $? -gt 0 ]; then
                        BCOUNT=$((BCOUNT + 1))
                fi
        done
        if [ $BCOUNT -gt 0 ]; then
		RC=1
        fi
}

