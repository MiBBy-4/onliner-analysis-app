class ScraperMethods < ApplicationService
  def httparty(url)
    HTTParty.get(url)
  end

  def nokogiri(unparsed_page)
    Nokogiri.HTML(unparsed_page)
  end
end