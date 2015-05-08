class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.references :party, null: false
      t.references :user, null: false
      t.string :status, default: "pending"
      t.string :recipe

      t.timestamps
    end
  end
end
