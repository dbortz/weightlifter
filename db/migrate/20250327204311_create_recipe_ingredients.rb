class CreateRecipeIngredients < ActiveRecord::Migration[8.0]
  def change
    create_table :recipe_ingredients do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.decimal :quantity, null: false, precision: 10, scale: 3  # Allows values like 1234567.890
      t.string :unit, null: false

      t.timestamps
    end

    # Ensure a recipe can't have the same ingredient twice
    add_index :recipe_ingredients, [:recipe_id, :ingredient_id], unique: true
  end
end
