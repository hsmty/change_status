#!/bin/bash

NETWORK='192.168.1.0/24'
VALIDMACS='/var/local/hacker.mac'
COMMAND='close'
USER='spaceapi'
SERVER='hsmty.org'
ID='/var/local/spaceapi.id_rsa'

COMP=`arp-scan $NETWORK| perl -ne 'm/((?:[0-9a-f]{2}[:-]){5}[0-9a-f]{2})/i; print $1, "\n"'| sort | comm -12 $VALIDMACS -`


if [[ $COMP ]]; then
	COMMAND='open'
fi

ssh -i $ID $USER@$SERVER chstatus $COMMAND
