require 'nokogiri'
require 'open-uri'
require 'rubygems'

# Ce bloc sert à scrapper l'email de Vauréal.
puts "L'adresse Email de la mairie de Vauréal"
def get_the_email_of_a_townhal_from_its_webpage(page_url)
	doc = Nokogiri::HTML(open(page_url))
	email= doc.css(".tr-last")[3].text.split(" ")[2]
	email	
end	

puts get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/95/vaureal.html")