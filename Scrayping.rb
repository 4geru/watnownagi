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
    p @page.css('panel').length
    p pannel.css('img').src
  end

end

# scraping_pages = ScrapingPage.new('http://www.dmm.co.jp/monthly/sod/-/list/=/sort=date/page=1/')
# print scraping_pages.get_titles