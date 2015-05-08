class CreateNonos < ActiveRecord::Migration
  def change
    create_table :nonos do |t|
      t.string :name, null: false
      t.string :type, null: false
      # possible values for type:
        # ingredient (q= excludedIngredient[])
        # allergy (q= allowedAllergy[])
        # vegetarian (q= allowedDiet[])

      t.timestamps
    end
  end
end
