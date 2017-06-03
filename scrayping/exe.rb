require './Scrayping'
require 'json'

url = 'https://www.u-coop.net/food/menu/hanshin/info.php?category=6111&uid=2c95f9230c51971001901adcbca1e79b'

scraping_pages = ScrapingPage.new(url)
menus = scraping_pages.get_titles.to_json

open('menus.json', 'w') do |io|
  JSON.dump(menus, io)
end
