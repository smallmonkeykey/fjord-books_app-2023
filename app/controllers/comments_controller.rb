class CommentsController < ApplicationController

    def new
        @report = Report.find(params[:report_id])
    end
end
