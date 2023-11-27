# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_commentable

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to @commentable
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
      redirect_to @commentable
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_commentable
    raise NotImplementedError
  end
end
