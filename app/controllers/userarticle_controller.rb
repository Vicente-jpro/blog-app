class UserarticleController < ApplicationController
 
  def show
    @user_articles = Article.all.where(user_id:params[:id])
  end
end
