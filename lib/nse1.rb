require "nse1/version"
require 'rubygems'
require 'crack'
require 'open-uri'

module Nse1
	class Stock

		def initialize(symbol)

			if symbol.include? "&"
				symbol.gsub!("&", "%26")
			end

			@symbol = symbol
			base_url = "http://www.nseindia.com/live_market/dynaContent/live_watch/get_quote/ajaxGetQuoteJSON.jsp?symbol="
			# base_url_suffix = "&series=EQ"
			full_url = base_url+@symbol
			content = open(full_url).read
			@parsed_local_content = Crack::JSON.parse(content)

			if @parsed_local_content['data'][0].nil?
				base_url = "http://www.nseindia.com/live_market/dynaContent/live_watch/get_quote/ajaxGetQuoteILJSON.jsp?symbol="
				full_url = base_url+@symbol
				content = open(full_url).read
				@parsed_local_content = Crack::JSON.parse(content)				
			end



		end
		

	  def self.nifty
	  	url = "http://www.nseindia.com/live_market/dynaContent/live_analysis/pre_open/nifty.json"
	  	content = open(url).read
	  	parsednifty = Crack::JSON.parse(content)["data"]
	  	# niftyarr = Nse1::Stock.list["data"]
	  	nifarr = []
		parsednifty.each do |has|
			 nifarr << has["symbol"]
		end
		return nifarr

	  end

	  def self.list
	  	url = "http://www.nseindia.com/live_market/dynaContent/live_analysis/pre_open/all.json"
	  	content = open(url).read
	  	parselist = Crack::JSON.parse(content)["data"]
	  	listarr = []
	  	parselist.each do |has|
	  		listarr << has["symbol"]
	  	end
	  	return listarr
	  end

	  def fulljson
	  	@parsed_local_content
	  end	

	  def last
		return @parsed_local_content['data'][0]['lastPrice'].to_s
	  end

	  def fullname
	  	unless @parsed_local_content['data'][0].nil?
	  		return @parsed_local_content['data'][0]['companyName']
	  	else
	  		return "some problem with the quote #{@symbol}"	
	  	end	
	  end

	  def change
	  	return @parsed_local_content['data'][0]['change']
	  end

	  def volume
	  	return @parsed_local_content['data'][0]['quantityTraded']
	  end

	  def openPrice
	  	return @parsed_local_content['data'][0]['open']
	  end

	  def low52
	  	return @parsed_local_content['data'][0]['low52']
	  end

	  def previousClose
	  	return @parsed_local_content['data'][0]['previousClose']
	  end

	  def high52
	  	return @parsed_local_content['data'][0]['high52']
	  end

	  def dayHigh
	  	return @parsed_local_content['data'][0]['dayHigh']
	  end

	  def dayLow
	  	return @parsed_local_content['data'][0]['dayLow']
	  end



	end
end



