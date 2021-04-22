require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

URL_AN = "https://www2.assemblee-nationale.fr/"
URL_list_deputes = "https://www2.assemblee-nationale.fr/deputes/liste/alphabetique"

def get_names(url)
    page = Nokogiri::HTML(URI.open(url).read)
    array_names =  page.css('article div#deputes-list div a').map(&:text)
end

def get_email(url_depute)
    page = Nokogiri::HTML(URI.open(url_depute).read)
    email_address =  page.css('dl.deputes-liste-attributs dd ul li[text() = "Mél : "] a[@href]').map(&:text).join
end


def get_deputes_urls(url)
    urls_array = []

    page = Nokogiri::HTML(URI.open(url).read)
    a_tag_array = page.css('article div#deputes-list a/@href').map(&:text)

    for i in 0..a_tag_array.length-1
        url = URL_AN + a_tag_array[i]
        urls_array.push(url)
    end

    urls_array
end

def collect_deputes_info(url)
    array_deputes_info = []
    for i in 0..get_deputes_urls(url).length-1 
        p hash = {"first_name" => get_names(url)[i].split[1], "last_name" => get_names(url)[i].split[2], "email" => get_email(get_deputes_urls(url)[i])}
        array_deputes_info.push(hash)
    end
    return arr
end

# collect_deputes_info("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique")


