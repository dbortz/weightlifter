class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  VALID_UNITS = %w[
    g
    kg
    oz
    lb
    ml
    l
    cup
    tbsp
    tsp
    pinch
    whole
  ].freeze

  validates :quantity, presence: true,
                      numericality: { greater_than: 0 }
  
  validates :unit, presence: true,
                  inclusion: { in: VALID_UNITS }

  validates :ingredient_id, uniqueness: { scope: :recipe_id,
    message: "has already been added to this recipe" }
end
