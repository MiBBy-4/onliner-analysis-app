class ArticlesScraper < HttpParseService
  def initialize(url)
    @article_url = url
  end

  def call
    unparsed_article = httparty(@article_url)
    parsed_article = nokogiri(unparsed_article)
    @article = {
      title: parsed_article.css('h1').first.text
    }
  end
end
