class ArticlesController < ApplicationController
  before_action :set_page_content, only: [:show]

  def index; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article found."
      redirect_to @article
    else
      render "new"
    end
  end

  def show; end

  private

  def article_params
    params.require(:article).permit(:link)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def set_page_content
    page = ArticlesScraper.new(set_article.link)
    @article = page.article
    @comments = page.comments
  end
end
