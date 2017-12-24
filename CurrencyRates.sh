#!/bin/bash

#************************************************#
#               CurrencyRates.sh                 #
#             written by James Walter            s#
#               24,December 2017                 #
#                                                #
#              Gathers Curreny rates             #
#************************************************#
# Takes a currency and returns the exchange rate to it.
# Uses JQ
# https://stedolan.github.io/jq/ 

jqAssert=`command -v jq`

if [[ $jqAssert == "" ]]; then
    echo "You need to install the JQ package to run this script"
    exit 1
fi

function genericCurrency {

    curl -s -X GET "https://api.fixer.io/latest?base=$currency" | jq 

    exit 0
}

function cryptoCurrency {
    curl -s  -X GET "https://min-api.cryptocompare.com/data/pricemulti?fsyms=${currency}&tsyms=BTC,USD,EUR,GBP" | jq

    exit 0
}

if [[ $1 == "crypto" ]]
then
    currency=$(echo $2 | tr /a-z/ /A-Z/)
    cryptoCurrency
elif [[ $1 == "normal" ]]
then
    currency=$(echo $2 | tr /a-z/ /A-Z/)
    genericCurrency
else
    echo "bad input, please use crypto <currency> or normal <currency>"        
    exit 1
fi

