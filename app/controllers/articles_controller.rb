class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @articles = Article.includes(:user).order("created_at DESC")
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
    @comment = Comment.new
    @comments = @article.comments.includes(:user)
    @likes_count = Like.where(article_id: @article.id).count
  end

  def edit
    unless @article.user_id == current_user.id
      redirect_to root_path
    end
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

  def search
    @articles = Article.search(params[:keyword]).order("created_at DESC")
  end

  private
  def article_params
    params.require(:article).permit(:title, :description, :image).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end