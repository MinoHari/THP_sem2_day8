require 'nokogiri'
require 'open-uri'
require 'rubygems'

#Ce bloc sert à scrapper l'email de Vauréal.
#puts "L'adresse Email de la mairie de Vauréal"
def get_the_email_of_a_townhal_from_its_webpage(page_url)
	doc = Nokogiri::HTML(open(page_url))
	email = doc.css(".tr-last")[3].text.split(" ")[2]
	email	
end	

#puts get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/95/vaureal.html")


#On récupère l'url de villes du Val d'oise.
#puts "Les url de villes du Val d'Oise"

def get_all_the_urls_of_val_doise_townhalls(page_url)
	tab =[]
	doc = Nokogiri::HTML(open(page_url))
	lien = doc.css(".lientxt") 
	lien.each{|link| tab.push("http://annuaire-des-mairies.com"+link['href'][1..-1])}
	tab
end

#puts get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")

#Url et Email des mairies

def get_name_and_email_of_val_doise
	t =[]
	doc = get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")
	doc.each do |val|
		t.push({
			:name => Nokogiri::HTML(open(val)).css('main h1')[0].text.split(" ")[0], 
			:email =>  get_the_email_of_a_townhal_from_its_webpage(val)
			})
        puts t
	end
	t
end
get_name_and_email_of_val_doise	