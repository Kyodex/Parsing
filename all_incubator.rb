require "nokogiri"
require"open-uri"

def get_all_incubator (web_site)
  page = Nokogiri::HTML(open(web_site))
    for i in (1..30)
      page.xpath("//tr[#{i}]/td[1]/strong").each do |incubator|
        inc = incubator.text
    puts inc
      end
    end
  end
get_all_incubator("https://lentreprise.lexpress.fr/creation-entreprise/etapes-creation/le-palmares-des-incubateurs-d-entreprise-dans-les-ecoles-de-commerce_1524810.html")
