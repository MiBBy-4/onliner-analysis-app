class ArticlesScraper < ApplicationService
  require 'nokogiri'
  require 'httparty'

  def initialize(url)
    @article_url = url
  end

  def article
    unparsed_article = httparty(@article_url)
    parsed_article = nokogiri(unparsed_article)
    @article = {
      title: parsed_article.css('h1').first.text
    }
  end
  private
  def httparty(url)
    HTTParty.get(url)
  end

  def nokogiri(unparsed_page)
    Nokogiri.HTML(unparsed_page)
  end
end
