require 'nokogiri'
require 'open-uri'
require 'rubygems'

def liste_incubateurs
	doc = Nokogiri::HTML(open('http://www.mon-incubateur.com/site_incubateur/incubateurs'))
	incubateurs = doc.css('span')[1..-3].text.split 
		
end
puts liste_incubateurs

def code_postal
	c = Nokogiri::HTML(open('http://www.mon-incubateur.com/site_incubateur/incubateurs'))
