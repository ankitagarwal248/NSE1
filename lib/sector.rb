require 'rubygems'
require 'crack'
require 'open-uri'
require 'nokogiri'
require 'csv'


=begin
	  def sector(symbol)
	  	rcount = 2
	  	begin

	  		
	  		# @symboll = "SBIN"
			base_url_sector = "http://www.moneycontrol.com/mccode/common/autosuggesion.php?query=#{symbol}&type=1&format=json&callback=suggest1"
			# puts base_url_sector
			page_sector = Nokogiri::HTML(open(base_url_sector))
			# puts page_sector
					
			link_suffix_sector =  page_sector.text.split("{")[1].split(",")[0].split(":")[2].gsub!("\"","")
			# puts link_suffix_sector
			full_link_sector = "http:"+link_suffix_sector
			# puts full_link_sector

			page = Nokogiri::HTML(open(full_link_sector))
			sector_name = page.css("div.FL").css("div.gry10")[0].text.split("|")[3].split(":")[1].strip
			return sector_name
		rescue
			
			if rcount>0
				puts "retry count for symbol #{symbol}: #{rcount}"
				rcount = rcount - 1
				retry
			else
				return "some problem with symbol: #{symbol}"
			end
			
		end		
	  end


	  	csv_text = File.read('errorsymbol.csv')
		csv = CSV.parse(csv_text, :headers => true)
		n= 0
		# symbolsarr = []
		csvfilearr = []
		csv.each do |row|   
			n=n+1
			r = row['SYMBOL']

		    # symbolsarr << r
		    p r
		    puts "#{n}----#{r}------#{sector(r)}"
		    csvarr = [r,sector(r)]
		    csvfilearr << csvarr
		    
		end


		CSV.open("nsedata_symbol_name_sector1.csv", "wb") do |csvs|
		   csvs << ['SYMBOL','SECTOR']

		   csvfilearr.each do |line|
		   	csvs << line
		   end
		end

=end

	  	csv_text_symbol_file = File.read('stocks.csv')
	  	csv_text_fullname_file = File.read('report.csv')
	  	csv_text_sector_file = File.read('nsedata_symbol_name_sector.csv')

		csv_symbol = CSV.parse(csv_text_symbol_file, :headers => true)
		csv_fullname = CSV.parse(csv_text_fullname_file, :headers => true)
		csv_sector = CSV.parse(csv_text_sector_file, :headers => true)

		sym_arry = []
		fullname_arry = []
		sector_arry = []
		csvfilearr = []

		csv_symbol.each do |row|   
			sym = row['SYMBOL']
			sym_arry << sym
		end

		csv_fullname.each do |row|   
			fullname = row['FULLNAME']
			fullname_arry << fullname
		end

		csv_sector.each do |row|   
			sector = row['SECTOR']
			sector_arry << sector
		end

		sym_arry.each_index do |index|
			row = [sym_arry[index],fullname_arry[index],sector_arry[index]]
			csvfilearr << row
		end


		CSV.open("nse_sym_name_sector.csv", "wb") do |csvs|
		   csvs << ['SYMBOL','FULLNAME','SECTOR']

		   csvfilearr.each do |line|
		   	csvs << line
		   end
		end