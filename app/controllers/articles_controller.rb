class ArticlesController < ApplicationController
  
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
    page = ArticlesScraper.new(find_article_link)
    @article = page.article
    @comments = page.comments
    # @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:link)
  end

  def find_article_link
    Article.find(params[:id]).link
  end
end