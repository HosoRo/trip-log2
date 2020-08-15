class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @articles = user.articles
    # unless @article.user_id == current_user.id
    #   redirect_to root_path
    # end
  end
end