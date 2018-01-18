require 'nokogiri'
require 'open-uri'
require 'rest_client'#gem permettant de recuperer un code html

def get_all_the_urls_of_val_doise_townhalls (web_list)
page = Nokogiri::HTML(RestClient.get(web_list))#recupere le code html du site
page.css("a.lientxt").each do |note|
note['href'] = note['href'][1..-1]#donne les urls de chaque commune en retirant le premier caractaire c-a-d "."
web_page = "http://annuaire-des-mairies.com" + note['href']
puts web_page
get_the_email_of_a_townhal_from_its_webpage(web_page)#rappel la fonction get_the_email_of_a_townhal_from_its_webpage pour recuperer les adresses emails grace aux liens (fonctions recurssive)
end
end

def get_the_email_of_a_townhal_from_its_webpage (web_page)#recupère les emails d'une ville
doc = Nokogiri::HTML(open(web_page))
	doc.xpath('//p[@class = "Style22"]').each do |node|
    if node.text.include?("@")
      node.text
    puts node.text
	end
end
end


get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise")
