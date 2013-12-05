load '../nse1.rb'




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






=begin
 has.each do |key, value|
 	p "#{key} --- #{value}"
 end
=end

# data =  has['data'][0]
# # p data['open']
# # p a.openPrice

# data.each do |key, value|
# 	# unless value.nil? || value == "-"
# 		p "#{key} --- #{value}"
# 	# end	
# end

# niftyarr = Nse1::Stock.list["data"]
# niftyarr.each do |has|
# 	p has["symbol"]
# end



=begin

l = Nse1::Stock.list
p l.length
n = 1
l.each do |name|
	a = Nse1::Stock.new(name).fullname
	
	p "#{n} --- #{name} --- #{a}"

	n=n+1
end

=end


# l.each_with_index do |name, value|
# 	a = Nse1::Stock.new(name).fullname
# 	p "#{name} --- #{a}"
# end

=begin
a = Nse1::Stock.new("L&TFH")
p a.fullname
=end


=begin
b = "l&tfh"
a = "L%26TFH"

if b.include? "&"
 	p "yes"
 	b.gsub!("&", "%26")
 	p b
else
 	p "no"  	
end
=end

=begin
require 'csv'

csv_text = File.read('stocks.csv')

csv = CSV.parse(csv_text, :headers => true)
n= 0
symbolsarr = []
csv.each do |row|   
	n=n+1
	r = row['SYMBOL']
    # puts "#{n}---#{row['SYMBOL']} -----------#{row['SERIES']}"
    symbolsarr << r

end
p symbolsarr
c = 0
csvfilearr = []
symbolsarr.each do |name|
	a = Nse1::Stock.new(name).fullname
	c= c+1
	# if a == "some problem with the quote"
	# 	p "some problem with the quote"
	# else
		p "#{c} --- #{name} --- #{a}"
	# end	

	csvarr = [name,a ]
	csvfilearr << csvarr

end


CSV.open("report.csv", "wb") do |csvs|
   csvs << ['SYMBOL','NAME']

   csvfilearr.each do |line|
   	csvs << line
   end

end
=end



# require 'rubygems'
# require 'nokogiri'
# require 'open-uri'
# require 'restclient'

# PAGE_URL = "http://www.moneycontrol.com/india/stockpricequote/bankspublicsector/statebankindia/SBI"
# page = Nokogiri::HTML(open(PAGE_URL))
# puts page.css("div.FL").css("div.gry10")[0].text.split("|")[3].split(":")[1].strip

# AXIS BANK

# require "nse1/version"
# require 'rubygems'
# require 'crack'
# require 'open-uri'

# http://www.moneycontrol.com/mccode/common/autosuggesion.php?query=AXISBANK&type=1&format=json&callback=suggest1
			# @symbol = symbol
			
			# base_url_suffix = "&series=EQ"
			# full_url = base_url+@symbol

			# content = open(base_url).read
			# @parsed_local_content = Crack::JSON.parse(content)
			# p @parsed_local_content

	# @symboll = "SBIN"
	# base_url = "http://www.moneycontrol.com/mccode/common/autosuggesion.php?query=#{@symboll}&type=1&format=json&callback=suggest1"
	# page = Nokogiri::HTML(open(base_url))
			
	# link_suffix =  page.text.split("{")[1].split(",")[0].split(":")[2].gsub!("\"","")
	# # puts link_suffix
	# full_link = "http:"+link_suffix
	# # puts full_link

	# page = Nokogiri::HTML(open(full_link))
	# puts page.css("div.FL").css("div.gry10")[0].text.split("|")[3].split(":")[1].strip




		 #  	 @symboll = "SBIN"
			# base_url_sector = "http://www.moneycontrol.com/mccode/common/autosuggesion.php?query=#{@symboll}&type=1&format=json&callback=suggest1"
			# puts base_url_sector
			# page_sector = Nokogiri::HTML(open(base_url_sector))
			# puts page_sector
					
			# link_suffix_sector =  page_sector.text.split("{")[1].split(",")[0].split(":")[2].gsub!("\"","")
			# puts link_suffix_sector
			# full_link_sector = "http:"+link_suffix_sector
			# puts full_link_sector

			# page = Nokogiri::HTML(open(full_link_sector))
			# puts page.css("div.FL").css("div.gry10")[0].text.split("|")[3].split(":")[1].strip


=begin
require 'csv'

csv_text = File.read('stocks.csv')

csv = CSV.parse(csv_text, :headers => true)
n= 0
symbolsarr = []
csv.each do |row|   
	n=n+1
	r = row['SYMBOL']
    # puts "#{n}---#{row['SYMBOL']} -----------#{row['SERIES']}"
    symbolsarr << r
    p r

    st = Nse1::Stock.new(r)
    puts "#{n}----#{r}------#{st.sector}" 
    
end



data = File.open("data.csv", "w")
content = "ankit, agarwal"
data.write(content)
data.close
=end



=begin

p symbolsarr
c = 0
csvfilearr = []
symbolsarr.each do |name|
	csv_fullname = Nse1::Stock.new(name).fullname
	csv_sector = Nse1::Stock.new(name).sector
	c= c+1
	# if a == "some problem with the quote"
	# 	p "some problem with the quote"
	# else
		p "#{c} ---#{csv_sector}----------------- #{name} ------------- #{csv_fullname}"
	# end	

	csvarr = [name,csv_fullname,csv_sector ]
	csvfilearr << csvarr

end


CSV.open("nsedata_symbol_name_sector.csv", "wb") do |csvs|
   csvs << ['SYMBOL','NAME', 'SECTOR']

   csvfilearr.each do |line|
   	csvs << line
   end

end
=end


