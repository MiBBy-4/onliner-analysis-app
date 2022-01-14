class CreateArticleService < ApplicationService
  def initialize(article_url)
    @article_url = article_url
  end

  def call
    article = Article.new(link: @article_url, title: article_title[:title])
  end

  def article_title
    ArticlesScraper.call(@article_url)
  end
end
