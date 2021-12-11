class UserarticleController < ApplicationController
 
  def show
    @user_articles = Article.all.where(user_id:params[:id]).paginate(page: params[:page], per_page: 2)
  end
end
