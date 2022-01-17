class CreateArticleService < ApplicationService
  def initialize(article_url)
    @article_url = article_url
  end

  def call
<<<<<<< HEAD
    article = Article.new(link: @article_url, title: article_title[:title])
=======
    Article.new(link: @article_url, title: article_title[:title])
>>>>>>> add_saving_all_dates_in_database
  end

  def article_title
    ArticlesScraper.call(@article_url)
  end
end
