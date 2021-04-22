require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

URL_annuaire_mairies = "https://www.annuaire-des-mairies.com/"
URL_mairies_val_doise = "https://www.annuaire-des-mairies.com/val-d-oise.html"

def get_townhall_email(townhall_url)
    page = Nokogiri::HTML(URI.open(townhall_url).read)
    email_address =  page.css('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').map(&:text).join
    city_name =  page.css('/html/body/div/main/section[2]/div/table/tbody/tr[1]/td[1]').map(&:text).join.split[-1]

    #put city name and email adress in a hash
    hash_town_email = {city_name => email_address}
end

def get_townhall_urls(url)
    urls_array = []

    page = Nokogiri::HTML(URI.open(url).read)
    a_tag_list = page.css('table table p a.lientxt')

    for i in 0..a_tag_list.length-1
        url = URL_annuaire_mairies + a_tag_list[i]['href']
        urls_array.push(url)
    end

    return urls_array
end

def collect_townhalls_names_and_emails(url)
    array_townhalls_names_and_emails = []
    for i in 0..get_townhall_urls(url).length-1
        array_townhalls_names_and_emails.push(get_townhall_email(get_townhall_urls(url)[i]))
    end
    return array_townhalls_names_and_emails
end

# collect_townhalls_names_and_emails(URL_mairies_val_doise)