# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :mentioning, class_name: 'Mention',
                        foreign_key: 'mentioning_id',
                        dependent: :destroy,
                        inverse_of: :mentioning
  has_many :mentioned, class_name: 'Mention',
                       foreign_key: 'mentioned_id',
                       dependent: :destroy,
                       inverse_of: :mentioned
  has_many :mentioning_reports, through: :mentioning, source: :mentioned
  has_many :mentioned_reports, through: :mentioned, source: :mentioning

  validates :title, presence: true
  validates :content, presence: true

  def editable?(target_user)
    user == target_user
  end

  def created_on
    created_at.to_date
  end

  def save_mention
    matches = Report.where(id: extract_numbers).where.not(id:)

    matches.each do |match|
      mentioning.create!(mentioned_id: match.id.to_i)
    end
  end

  def create_report
    ActiveRecord::Base.transaction do
      save_mention if save
    end
  end

  def update_report(report_params)
    ActiveRecord::Base.transaction do
      save_mention if update(report_params) && mentioning_reports.destroy_all
    end
  end

  private

  def extract_numbers
    content.scan(%r{http://localhost:3000/reports/(\d+)}).flatten
  end
end
