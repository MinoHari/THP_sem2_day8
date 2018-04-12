require 'nokogiri'
require 'open-uri'
require 'rubygems'

#On récupère l'url de villes du Val d'oise.
puts "Les url de villes du Val d'Oise"

def get_all_the_urls_of_val_doise_townhalls(page_url)
	tab =[]
	doc = Nokogiri::HTML(open(page_url))
	lien = doc.css(".lientxt") 
	lien.each{|link| tab.push("http://annuaire-des-mairies.com"+link['href'][1..-1])}
	tab
end

puts get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")
 