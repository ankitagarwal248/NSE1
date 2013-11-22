load 'nse1.rb'


=begin

a = Nse1::Stock.new("APLAB")
p a.last
has = a.fulljson
p has["lastUpdateTime"]

=end

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



require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'restclient'

PAGE_URL = "http://www.moneycontrol.com/stock-charts/statebankindia/charts/SBI"
page = Nokogiri::HTML(open(PAGE_URL))
puts page.css("div.FL").css("div.gry10")[0].text.split("|")[3].split(":")[1]


