# frozen_string_literal: true

class Mention < ApplicationRecord
  belongs_to :mentioning, class_name: 'Report'
  belongs_to :mentioned, class_name: 'Report'
  validate :validate_not_same_id

  private

  def validate_not_same_id
    errors.add('自分の日報を言及することはできません') if mentioning_id == mentioned_id
  end
end
