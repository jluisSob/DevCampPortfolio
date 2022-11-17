class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular
    # Whats this is going to do is inside of this
    where(subtitle: 'Angular ')
  end

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }
end
