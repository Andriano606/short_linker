# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :user_links, dependent: :destroy
  has_many :links, through: :user_links

  has_one :subscription, dependent: :destroy

  def admin?
    false
  end
end
