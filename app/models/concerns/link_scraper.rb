module LinkScraper
  def scrape_title(url)
    index_page = Nokogiri::HTML(open("#{url}"))
    index_page.css('title').text
  end
end