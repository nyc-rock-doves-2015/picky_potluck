class CreateChosenRecipes < ActiveRecord::Migration
  def change
    create_table :chosen_recipes do |t|
      t.references :recipe, null: false
      t.references :rsvp, null: false

      t.timestamps
    end
  end
end
