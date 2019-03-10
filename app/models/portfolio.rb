class Portfolio < ApplicationRecord
  after_initialize :set_defaults
  validates_presence_of :title, :body, :main_image, :thumb_image

  def set_defaults
    self.main_image ||= "https://via.placeholder.com/600x400"
    self.thumb_image ||= "https://via.placeholder.com/350x200"
  end
end
