#!/bin/bash

#************************************************#
#               CurrencyRates.sh                 #
#             written by James Walter            #
#               24,December 2017                 #
#                                                #
# Takes a currency and returns the exchange rate.#
#************************************************#

source userSettings.cfg

jqAssert=`command -v jq`

if [[ $jqAssert == "" ]]; then
    echo "You need to install the JQ package to run this script"
    exit 1
fi

function genericCurrency {
    if [[ "$listCurrency" == "true" ]]
    then
        curl -s -X GET "https://api.fixer.io/latest" | jq --sort-keys --raw-output . | tail -n+5 |  sed 's/: [0-9]*.[0-9]*//g'  
    else
        curl -s -X GET "https://api.fixer.io/latest?base=${currency}&symbols=${normalReturnedCurrencys}" | jq 
    fi
    exit 0
}

function cryptoCurrency {
    if [[ ! -z "$listCurrency"  ]]
    then
        curl -s -X GET "https://min-api.cryptocompare.com/data/all/coinlist" | jq --sort-keys --raw-output . | grep "FullName" | sed 's/"FullName"://'
    else
        curl -s -X GET "https://min-api.cryptocompare.com/data/pricemulti?fsyms=${currency}&tsyms=${cryptoReturnedCurrencys}" | jq 
    fi
    exit 0
}

while getopts "lL" OPTION
do
	case $OPTION in
		l)
			echo "You set flag -l"
			listCurrency="true"
			;;
		L)
			echo "You set flag -L"
			listCurrency="true"
			;;
		\?)
			exit
			;;
	esac
done

if   [[ "${@: -2:1}" == "crypto" || "${@: -1}" == "crypto"  ]]
then
    currency=$(echo "${@: -1}" | tr /a-z/ /A-Z/)
    cryptoCurrency
elif [[ "${@: -2:1}" == "normal" ||  "${@: -1}" == "normal"  ]]
then
    currency=$(echo "${@: -1}" | tr /a-z/ /A-Z/)
    genericCurrency
else
    echo "bad input, please use:
            <flag> <crypto||normal> 
            or
            <crypto||normal> <currency>  
            "     
    exit 1
fi
done