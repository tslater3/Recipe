class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.belongs_to :user
      t.integer :user_id
      t.string :name
      t.string :prep_time
      t.string :occasion
      t.text :description
      t.string :ethnicity

      t.timestamps null: false
    end
  end
end
