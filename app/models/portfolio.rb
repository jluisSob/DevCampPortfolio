class Portfolio < ApplicationRecord
  has_many :technologies

  accepts_nested_attributes_for :technologies,
                                  reject_if: lambda { |attrs| attrs['name'].blank? }

  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular
    # Whats this is going to do is inside of this
    where(subtitle: 'Angular ')
  end

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

  after_initialize :set_defaults

  def set_defaults
    # Let's have the ability to set the default values of the main_image and thumb_image
    self.main_image ||= Placeholder.image_generator(height: 600, width: 400)
    self.thumb_image ||= Placeholder.image_generator(height: 350, width: 200)
  end
end

# Portfolio.create!(title: "Web app", subtitle: "Some sub", boby: "Some body aleatory", technologies_attributes: [{name: 'Ruby'}, {name: 'Rails'}, {name: 'Angular'}, {name: 'Iconic'}])
