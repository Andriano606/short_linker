

class Link < ApplicationRecord
  before_create :create_short_link

  has_many :user_links, :foreign_key => :short_link
  has_many :users, through: :user_links

  def self.generate_short_link(full_link)
    Digest::CRC32.checksum(full_link).to_s(16)
  end

  def create_short_link
    self.short_link = Link::generate_short_link(self.full_link)
  end
end
