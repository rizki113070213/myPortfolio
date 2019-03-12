class Skill < ApplicationRecord
  include Placeholder
  after_initialize :set_defaults
  validates_presence_of :title, :percent_utilized

  def set_defaults
    self.badge ||= Placeholder.image_generator(250, 250) 
  end
end
