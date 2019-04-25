class Skill < ApplicationRecord
  validates_presence_of :title, :percent_utilized

  def self.utilized
    all.order("percent_utilized desc")
  end
end
