require 'mechanize'
require 'json'

class ScrapingPage
  def initialize(url)
    agent = Mechanize.new
    @page = agent.get(url)
    @url = url
  end

  def get_titles
    pannel = @page.css('panel')[0]
    @page.search('div.panel')[1..-1].map { |item|
      title = item.text.gsub(/[ \r\n　]/,'')
      src = item.search('img')[0].attributes['src'].value
      src = src.gsub('../','https://www.u-coop.net/food/menu/')
      id =  src.gsub(/[\/.]/, ' ').split(' ')[-2].to_i
      next if id == 'noimage'
      [id, { 'title': title, 'id': id }]        
    }.to_h
  end

end

# scraping_pages = ScrapingPage.new('http://www.dmm.co.jp/monthly/sod/-/list/=/sort=date/page=1/')
# print scraping_pages.get_titles