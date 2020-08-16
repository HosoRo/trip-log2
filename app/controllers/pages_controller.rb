class PagesController < ApplicationController
  def index
    @articles = Article.includes(:user).order("created_at DESC").limit(5)
    # @articles = Article.includes(:article_images).order('created_at DESC')
    # @categories = Article.includes(:article_images).where(category_id:1..4).order('created_at DESC').limit(4).where.not(trading_status: 0)
  end

  def about
  end

end

  