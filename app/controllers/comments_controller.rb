class CommentsController < ApplicationController
 	before_action :set_article_id, only: %i[ update create]

 	def edit
 	 @comment = Comment.find(params[:article_id])
 	 render json: @comment
 	end

 	def create
	  @article.comments.create(set_params)
	  redirect_to @article
 	end

 	def update
 	  @article.comments.update(set_params)
	  redirect_to @article
 	end

 	def destroy
 	  @comment = Comment.find(params[:id])
 	  @comment.destroy

 	  redirect_to @article
 	end

 	def set_params
 	  params.required(:comment).permit(:description)
 	end

 	def set_article_id
 	  @article = Article.find(params[:article_id])
 	end
end
