class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.belongs_to :recipe
      t.integer :recipe_id
      t.string :name

      t.timestamps null: false
    end
  end
end
