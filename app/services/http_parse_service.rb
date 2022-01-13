class HttpParseService < ApplicationService
  def httparty(url)
    HTTParty.get(url)
  end

  def nokogiri(page)
    Nokogiri.HTML(page)
  end
end
