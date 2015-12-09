#!/bin/bash

if [[ $# -lt 3 ]] ; then
    echo 'Usage: ./build.sh EJABBERD_INSTALLATION_PATH EJABBERD_LIB_PATH OUTPUT_PATH'
    exit
fi

EJBR_PATH=$1
EJBR_LIB_PATH=$2
OUTPUT_PATH=$3
mkdir -p $OUTPUT_PATH/ebin
echo '$EJBR_PATH/bin/erlc -DNO_EXT_LIB -DLAGER -pa $EJBR_LIB_PATH/ebin -I $EJBR_LIB_PATH/include/ -o $OUTPUT_PATH/ebin/ src/*'
$EJBR_PATH/bin/erlc -DNO_EXT_LIB -DLAGER -pa $EJBR_LIB_PATH/ebin -I $EJBR_LIB_PATH/include/ -o $OUTPUT_PATH/ebin/ src/*
echo 'cp -r conf $OUTPUT_PATH/'
cp -r conf $OUTPUT_PATH/conf
