# frozen_string_literal: true

class User < ApplicationRecord
  has_many :reports, dependent: :destroy
  has_many :users, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [150, 150]
  end

  def display_name
    name.empty? ? email : name
  end
end
