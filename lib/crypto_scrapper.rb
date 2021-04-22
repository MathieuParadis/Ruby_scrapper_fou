require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

URL = 'https://coinmarketcap.com/all/views/all/'

def crypto_scrapper
    page = Nokogiri::HTML(URI.open(URL).read)

    # names = '//div[@class="sc-1kxikfi-0 fjclfm cmc-table__column-name"]'
    # prices = '//div[@class="price___3rj7O "]'

    names = 'div table tbody td div a[@title]'
    prices = 'div table tbody td div[@class="price___3rj7O "] a'

    names_array = page.css(names).map(&:text)
    prices_array =  page.css(prices).map(&:text)

    array_of_hashes_crypto_and_value = names_array.zip(prices_array).map{|k, v| {k => v.delete("$,").to_f}}

    array_of_hashes_crypto_and_value
end


p crypto_scrapper
