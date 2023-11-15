class CommentsController < ApplicationController

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to @commentable

  end

  private
	def comment_params
    params.require(:comment).permit(:content)
  end

end
