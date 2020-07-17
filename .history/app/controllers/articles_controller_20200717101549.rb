class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(article_params)
    if @article.save
     flash[:notice] = "記事が投稿されました"
     redirect_to article_path(@article)
    else
     render 'new'
    end
  end

  def new
    @article = Article.new
  end

  def show
  @article = Article.find(params[:id])
  end

  def edit
  @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
     flash[:notice] = "記事が更新されました"
     redirect_to article_path(@article)
    else
     flash[:notice] = "記事の更新ができませんでした"
     render 'edit'
    end
  end

  private
  def article_params
  params.require(:article).permit(:title, :description)
  end
end