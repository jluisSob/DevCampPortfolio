class Skill < ApplicationRecord
  include Placeholder
  validates_presence_of :title, :percent_utilized

  after_initialize :set_defaults

  def set_defaults
    # Let's have the ability to set the default values of the main_image and thumb_image
    self.badge ||= Placeholder.image_generator(height: 250, width: 250)
  end
end
