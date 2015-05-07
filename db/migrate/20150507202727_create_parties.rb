class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name, null: false
      t.datetime :date
      t.string :location
      t.string :photo_url

      t.timestamps
    end
  end
end
