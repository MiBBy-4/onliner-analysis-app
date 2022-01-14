class CommentsScraper < HttpParseService
  def initialize(url)
    @article_url = url
  end

  def call
    @comments_url = @article_url.insert(-6, '/comments').insert(-1, '#comments')
    unparsed_comments = httparty(@comments_url)
    parsed_comments = nokogiri(unparsed_comments)

    comment_listings = parsed_comments.css('div.onecomm')
    comment_listings.map do |comment_listing|
      {
        content: comment_listing.css('p.commtext').text
      }
    end
  end
end
