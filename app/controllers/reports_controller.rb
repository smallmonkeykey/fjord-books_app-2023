class ReportsController < ApplicationController

  def index
    @reports = Report.order(:id).page(params[:page])
  end

	def new
    @report = Report.new
  end

	def create
    	# @report = Report.new(report_params).users.build
			# @report.save

    @user = current_user
    @report = @user.reports.create(report_params)

    if @report.save
      puts "保存した" 
    else
      puts "保存できない" 
      p report_params
    end

    redirect_to reports_path

    #   @report = Report.create!(report_params)
		# redirect_to reports_path

    # respond_to do |format|
    #   if @report.save
    #     format.html { redirect_to report_url(@report), notice: t('controllers.common.notice_create', name: report.model_name.human) }
    #     format.json { render :show, status: :created, location: @report }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @report.errors, status: :unprocessable_entity }
    #   end
		# end
  end

  def show
    @report = Report.find(params[:id])
  end

	private

  def report_params
    params.require(:report).permit(:title, :content)
  end

end
