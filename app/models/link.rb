# frozen_string_literal: true

class Link < ApplicationRecord
  has_many :user_links, dependent: :destroy
  has_many :users, through: :user_links

  def self.generate_short_link(full_link)
    Digest::CRC32.checksum(full_link).to_s(16)
  end
end
