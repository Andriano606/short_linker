# frozen_string_literal: true

class UserLink < ApplicationRecord
  belongs_to :user
  belongs_to :link, foreign_key: :short_link
end
