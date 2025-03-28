class Ingredient < ApplicationRecord
  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipes, through: :recipe_ingredients

  validates :name, presence: true, 
                  uniqueness: { case_sensitive: false },
                  length: { minimum: 2, maximum: 255 }
  
  validates :density, numericality: { 
    greater_than: 0,
    less_than: 100000,
    allow_nil: true
  }

  before_save :normalize_name

  private

  def normalize_name
    self.name = name.downcase.strip
  end
end
