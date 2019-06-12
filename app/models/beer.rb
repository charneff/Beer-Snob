class Beer < ApplicationRecord
  belongs_to :brewery
  belongs_to :user #creator
  has_many :reviews
  has_many :users, through: :reviews #user who reviewed
  accepts_nested_attributes_for :brewery

  # def brewery_attributes=(attributes)
  #   brewery = Brewery.find_or_create_by(attributes) if !name.empty?
  # end
end
