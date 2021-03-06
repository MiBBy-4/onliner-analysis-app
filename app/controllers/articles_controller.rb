class ArticlesController < ApplicationController
  before_action :set_article, only:[:show]

  def index
    @articles = Article.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = CreateArticleService.call(article_params[:link])
    if @article.save
      flash[:notice] = "redirect_to @article"
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
end
