# Nse1

A Ruby gem for equity stock data from www.nseindia.com 

## Installation

Add this line to your application's Gemfile:

    gem 'nse1'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nse1

## Usage

    Nse1::Stock.nifty
    Nse1::Stock.list

    a = Nse1::Stock.new("COX&KINGS")

     a.symbol
     a.last
     a.sector
     a.fullname
     a.lastUpdateTime
     a.change
     a.volume
     a.openPrice
     a.low52
     a.previousClose
     a.high52
     a.dayHigh
     a.dayLow
     a.fulljson

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


