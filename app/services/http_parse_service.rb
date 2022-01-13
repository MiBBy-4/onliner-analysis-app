class HttpParseService < ApplicationService
  def httparty(url)
    HTTParty.get(url)
  end

  def nokogiri(page)
    Nokogiri.HTML(unparsed_page)
  end
end
