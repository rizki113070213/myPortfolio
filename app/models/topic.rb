class Topic < ApplicationRecord
  validates_presence_of :title
  has_many :blogs

  def self.with_blogs status
    if status == ""
      includes(:blogs).where.not(blogs: {id: nil})
    else
      includes(:blogs).where.not(blogs: {id: nil, status: status})
    end
  end
end
