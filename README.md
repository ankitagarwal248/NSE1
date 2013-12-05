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

p Nse1::Stock.nifty
p Nse1::Stock.list

a = Nse1::Stock.new("COX&KINGS")
p a.symbol
p a.last
p a.sector
p a.fullname
p a.lastUpdateTime
p a.change
p a.volume
p a.openPrice
p a.low52
p a.previousClose
p a.high52
p a.dayHigh
p a.dayLow
p a.fulljson

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


