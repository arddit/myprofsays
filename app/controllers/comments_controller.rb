class CommentsController < ApplicationController

	def create
	  @post = Post.friendly.find(params[:post_id])
	  @comment = @post.comments.create(comment_params)
	  @comment.user_id = current_user.id
	  if @comment.save
	    redirect_to @post
	  else
	    flash.now[:danger] = "error"
	  end
	end

	def destroy
    @post = Post.friendly.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to @post
  end

	private

    def comment_params
      params.require(:comment).permit(:text, :user_id, :post_id)
    end

end
