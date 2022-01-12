class CommentsScraper < ApplicationService
  require 'nokogiri'
  require 'httparty'

  def initialize(url)
    @article_url = url
  end

  def comments
    @comments_url = @article_url.insert(-6, '/comments').insert(-1, '#comments')
    unparsed_comments = httparty(@comments_url)
    parsed_comments = nokogiri(unparsed_comments)

    comment_listings = parsed_comments.css('div.onecomm')
    comment_listings.map do |comment_listing|
      comment = {
        user_name: comment_listing.css('strong.name').text,
        comment: comment_listing.css('p.commtext').text,
        date: comment_listing.css('span.datetime').text
      }
    end
  end

  private
  def httparty(url)
    HTTParty.get(url)
  end

  def nokogiri(unparsed_page)
    Nokogiri.HTML(unparsed_page)
  end
end