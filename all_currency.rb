require "nokogiri"
require"open-uri"

def get_all_currency (web_site)
  h = Hash.new {|currency,value|currency[value]="" }
  page = Nokogiri::HTML(open(web_site))
for i in (1..1448)
  page.xpath("//tr[#{i}]/td[2]/a").each do |currency| # recupère la cryptomonnaie ,
    page.xpath("//tr[#{i}]/td[5]/a").each do |value|# recupère sa valeur
      h[currency.text]=value.text
      end
    end
  end
 puts h
end

get_all_currency ("https://coinmarketcap.com/all/views/all/")
# le programme va prendre un peu de temps a charger a cause du grand nombre de cryptomonnai ^^
