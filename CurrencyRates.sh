#!/bin/bash

# Takes a currency and returns the exchange rate to it.
# Uses JQ
# https://stedolan.github.io/jq/ 
jqAssert=`command -v jq`

if [[ $jqAssert == "" ]]; then
    echo "You need to install the JQ package to run this script"
    exit 1
fi
echo "Please enter the Currency you want rates on"

read currency

curl -X GET https://api.fixer.io/latest?base=$currency | jq 

exit 0
