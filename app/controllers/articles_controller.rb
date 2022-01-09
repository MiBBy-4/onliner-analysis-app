class ArticlesController < ApplicationController
  
  def index

  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Статья найдена."
      redirect_to @article
    else
      render "new"
    end
  end

  def show
    page = ArticlesScraper.new(Article.find(params[:id]).link)
    @article = page.get_article
    @comments = page.get_comments
    # @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:link)
  end
end