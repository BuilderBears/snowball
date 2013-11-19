module LinkScraper
  def scrape_title(url)
    begin
      index_page = Nokogiri::HTML(open("#{url}"))
      index_page.css('title').text
    rescue
      "Scraper failed to find title tag."
    end
  end
end