class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]

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
  end

  def edit
  end

  def update
    if @article.update(article_params)
     flash[:notice] = "記事が更新されました"
     redirect_to article_path(@article)
    else
     flash[:notice] = "記事の更新ができませんでした"
     render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "記事が削除されました"
    redirect_to articles_path
   end

  private
  def article_params
  params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end