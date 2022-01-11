class ArticlesController < ApplicationController
  before_action :set_article, only:[:show]

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

  def show
    page = ArticlesScraper.new(@article.link)
    @article = page.article
    @comments = page.comments 
  end

  private

  def article_params
    params.require(:article).permit(:link)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
