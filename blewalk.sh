#!/bin/bash

GATTTOOL=${GATTTOOL:-gatttool -t random -b $1}

INDENT=0
indent_n_echo() {
	local i
	for i in `seq 1 $INDENT`; do
		echo -ne '\t'
	done
	echo "$1"
}

indent_n_echo "BLE MAC $1"
INDENT=$(($INDENT+1))

indent_n_echo "primary"
INDENT=$(($INDENT+1))
$GATTTOOL --primary | \
	while read l; do
		indent_n_echo "$l"
	done
INDENT=$(($INDENT-1))

INDENT=$(($INDENT-1))

