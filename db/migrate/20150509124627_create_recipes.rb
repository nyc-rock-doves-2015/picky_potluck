class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :recipe_url, null: false
      t.string :photo_url
      t.string :name
    end
  end
end
