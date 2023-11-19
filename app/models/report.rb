# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :mentioning_reports, class_name:  "Mention",
                                  foreign_key: "mentioning_id",
                                  dependent:   :destroy,
                                  inverse_of: :mentioning
  has_many :mentioned_reports, class_name:  "Mention",
                                   foreign_key: "mentioned_id",
                                   dependent:   :destroy,
                                   inverse_of: :mentioned
  has_many :mentioning, through: :mentioning_reports
  has_many :mentioned, through: :mentioned_reports

  validates :title, presence: true
  validates :content, presence: true

  def editable?(target_user)
    user == target_user
  end

  def created_on
    created_at.to_date
  end
end
