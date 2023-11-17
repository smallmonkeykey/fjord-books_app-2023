class CommentsController < ApplicationController
   before_action :set_commentable

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

  def set_commentable
   raise NotImplementedError
  end

end
