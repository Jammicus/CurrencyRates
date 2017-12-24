# CurrencyRates
Basic bash script to get crypto or normal currency rates.

## Dependancies.

This script uses the JQ command to show the rates in a clear format

If you do not have JQ, you can get it here: https://stedolan.github.io/jq/

You also need internet access so we can poll the desired API to get the rates.


## Usage

To get the rates of a normal currency, use 
`normal <currency>`
To get the rates of a crypto currency, use
`crypto <currency>`

In both cases, the currency should be the 3 letter  abbreviation of the currency. For example, British Pounds would be GBP

## APIs used.

* https://min-api.cryptocompare.com
* https://api.fixer.io