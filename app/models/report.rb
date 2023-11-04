# frozen_string_literal: true

class Report < ApplicationRecord
    belongs_to :users, class_name: "User", foreign_key: "user_id"
end
