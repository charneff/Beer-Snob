class Beer < ApplicationRecord
  belongs_to :brewery
  belongs_to :user #creator
  has_many :reviews
  has_many :users, through: :reviews #user who reviewed
  accepts_nested_attributes_for :brewery
  validates :flavor, presence: true
  validate :not_a_duplicate

   scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(stars) desc')}

   def self.alpha
    order(:name)
  end

  def brewery_attributes=(attributes)
    brewery = Brewery.find_or_create_by(attributes) if !name.empty?
  end

  def not_a_duplicate
  # if there is already an ice cream with that flavor && brand, throw an error
    if Beer.find_by(name: name, brewery_id: brewery_id)
      errors.add(:name, 'has already been added for that brand')
    end
  end


 def flavor_and_brewery
  "#{name} - #{brewery.name}"
end
end
