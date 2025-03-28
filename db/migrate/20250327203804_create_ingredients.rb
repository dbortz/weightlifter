class CreateIngredients < ActiveRecord::Migration[8.0]
  def change
    create_table :ingredients do |t|
      t.string :name, null: false
      t.decimal :density, precision: 8, scale: 3  # Allows values like 1234.567

      t.timestamps
    end

    add_index :ingredients, :name, unique: true
  end
end
