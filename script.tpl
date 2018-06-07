#!/bin/bash

# REMOVE THIS LINE - IT IS USED TO DELETE UNUNSED SCRIPTS - PATTERN MATCH UNUSEDSCRIPTXXX

. utils.shi

VERBOSE=false
CLEANUPFILES=
FILES=

cleanup()
{
    vbecho "---"
    vbecho "Cleaning Up - Deleting $CLEANUPFILES"							### REPLACE.
    vbecho "---"
    rm -f $CLEANUPFILES														### REPLACE.
}
trap cleanup EXIT


doit() 
{
	# ... do something!
}

Usage() 
{
	errecho "Usage: $0 <args ...> -- ADD USAGE SUMMARY"						### REPLACE.
	errecho "Describe Usage ... "											### REPLACE.
	errecho "Describe Flags"												### REPLACE.
}

checkArgs()
{
	checkNotEmptyString "$0: An output file must be given" $YOURARGHERE 	### REPLACE.
	if (($# < 2)); then Usage; fi 											### REPLACE.
}

processArgs()
{
	while ! test -z "$1"; do
		case $1 in
			-o|--output)			## 2 arg option. 						### REPLACE.
				OUTPUTFILE=$2; 
				shift; 
				shift;
				;;
			-v)						## 1 arg option.						### REPLACE.
				VERBOSE=true;
				shift;
				;;
			*)  
				FILES="$FILES "$1
				shift;
				;;
		esac;

	done


	checkArgs $FILES
	doit $FILES
}

processArgs $*;

case $# in
	2) 
		doit $*
		;;
	*) 
		Usage 
		;;
esac;
