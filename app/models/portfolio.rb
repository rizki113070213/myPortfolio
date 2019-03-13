class Portfolio < ApplicationRecord
  include Placeholder
  after_initialize :set_defaults
  validates_presence_of :title, :body, :main_image, :thumb_image

  has_many :technologies, dependent: :destroy
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  def set_defaults
    # self.main_image ||= "https://via.placeholder.com/600x400"
    # self.thumb_image ||= "https://via.placeholder.com/350x200"
    self.main_image ||= Placeholder.image_generator(600, 400)
    self.thumb_image ||= Placeholder.image_generator(350, 200)
  end
end
