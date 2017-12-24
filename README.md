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

To list all currency options from either the crypto or normal API, add the -L flag before the crypto or normal command.

`-L crypto`
`-L normal`

In both cases, the currency should be the 3 letter  abbreviation of the currency. For example, British Pounds would be GBP

## Usersettings

In the userSettings.cfg file, you can specify the quote currencies you want returned when you query a base currency. Each variable takes a comma seperated list.

 The two fields provided are:

normalReturnedCurrencys, which queries http://fixer.io/
cryptoReturnedCurrencys, which queries https://www.cryptocompare.com/

By default quote curries are GBP and USD

Please remember that two different APIs are used. If you try and pass the BTC/Bitcoin to the normal currency API, you will get errors. 


## APIs used.

* https://min-api.cryptocompare.com
* http://fixer.io/