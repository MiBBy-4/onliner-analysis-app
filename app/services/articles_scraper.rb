require 'nokogiri'
require 'httparty'

class ArticlesScraper

  def initialize(url)
    @article_url = url
  end

  def get_article
    unparsed_article = HTTParty.get(@article_url)
    parsed_article = Nokogiri.HTML(unparsed_article)
    @article = {
      title: parsed_article.css('h1').first.text
    }
  end

  def get_comments
    @comments_url = @article_url.insert(-6, '/comments').insert(-1, '#comments')
    unparsed_comments = HTTParty.get(@comments_url)
    parsed_comments = Nokogiri.HTML(unparsed_comments)
    @comments = []

    comment_listings = parsed_comments.css('div.onecomm')
    comment_listings.each do | comment_listing |
      comment = {
        user_name: comment_listing.css('strong.name').text,
        comment: comment_listing.css('p.commtext').text,
        date: comment_listing.css('span.datetime').text
      }
      @comments << comment
    end
    @comments
  end
end