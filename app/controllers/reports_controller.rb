# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[edit update destroy]

  def index
    @reports = Report.includes(:user).order(id: :desc).page(params[:page])
  end

  def show
    @report = Report.find(params[:id])
    @mentions = @report.mentioned
  end

  # GET /reports/new
  def new
    @report = current_user.reports.new
  end

  def edit; end

  def create
      @report = current_user.reports.new(report_params)

      if @report.valid?
        matches = @report.content.scan(%r{http://localhost:3000/reports/(\d+)})
        ActiveRecord::Base.transaction do
          @report.save!
          save_mention(matches)
        end
        redirect_to @report, notice: t('controllers.common.notice_create', name: Report.model_name.human)
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
    if @report.update(report_params)
      matches = @report.content.scan(%r{http://localhost:3000/reports/(\d+)})
      ActiveRecord::Base.transaction do
        @report.mentioning_reports.destroy_all
        save_mention(matches)
      end
      redirect_to @report, notice: t('controllers.common.notice_update', name: Report.model_name.human)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @report.destroy

    redirect_to reports_url, notice: t('controllers.common.notice_destroy', name: Report.model_name.human)
  end

  private

  def set_report
    @report = current_user.reports.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :content)
  end

  def save_mention(matches)
    matches.each do |match|
      if match[0].to_i != @report.id || (Report.select("id").pluck(:id) - [@report.id]).include?(match[0].to_i)
      @report.mentioning.create!(mentioned_id: match[0].to_i)
      end
    end
  end
end
