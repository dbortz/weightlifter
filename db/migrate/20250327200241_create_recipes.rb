class CreateRecipes < ActiveRecord::Migration[8.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :source_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
