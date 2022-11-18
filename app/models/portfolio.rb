class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular
    # Whats this is going to do is inside of this
    where(subtitle: 'Angular ')
  end

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

  afer_initialize :set_defaults

  def set_defaults
    # Let's have the ability to set the default values of the main_image and thumb_image
    self.main_image ||= "http://placehold.it/600x400"
    self.thumb_image ||= "http://placehold.it/350x200"
  end
end
