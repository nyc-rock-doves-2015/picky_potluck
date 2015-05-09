class CreateClaimedDishes < ActiveRecord::Migration
  def change
    create_table :claimed_dishes do |t|
        t.string :yummly_id, null: false
        t.string :photo_url
        t.string :name
        t.references :rsvp, null: false
        t.timestamps
    end
  end

end
