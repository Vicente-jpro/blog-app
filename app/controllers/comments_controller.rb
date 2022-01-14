class CommentsController < ApplicationController
 	before_action :set_article_id, only: %i[update create destroy]
 	before_action :set_comment, only: %i[update]

 	def edit
 	 @comment = Comment.find(params[:article_id])
 	 @article = @comment.article
 	end

 	def create
	  @article.comments.create(set_params)
	  redirect_to @article
 	end

 	def update
	 @comment.update(set_params)
     redirect_to @article
 	end

 	def destroy
 	  @comment = Comment.find(params[:id])
 	  @comment.destroy

 	  redirect_to @article
 	end

 	private	 	
	 	def set_params
	 	  params.required(:comment).permit(:description)
	 	end

	 	def set_article_id
	 	  @article = Article.find(params[:article_id])
	 	end

	 	def set_comment
	 	  @comment = Comment.find(params[:id])
	 	end


end
