class HttpParseService < ApplicationService
  require 'nokogiri'
  require 'httparty'

  def httparty(url)
    HTTParty.get(url)
  end

  def nokogiri(unparsed_page)
    Nokogiri.HTML(unparsed_page)
  end
end
