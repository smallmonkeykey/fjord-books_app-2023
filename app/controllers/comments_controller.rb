class CommentsController < ApplicationController

	def new
    @report = Report.find(params[:report_id])
    @comment = Comment.new
	end

	def create
    # @report = Report.find(params[:report_id])
		# @comment = @report.comments.create(comment_params)
    # @comment.user = current_user

	@comment = @commentable.comments.new(comment_params)
	@comment.user = current_user
	@comment.save

   if @comment.save
       redirect_to report_path(@report)
   end

  end

  private
	def comment_params
    params.require(:comment).permit(:content)
  end

end
