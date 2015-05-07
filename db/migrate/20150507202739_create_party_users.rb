class CreatePartyUsers < ActiveRecord::Migration
  def change
    create_table :party_users do |t|
      t.references :party, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
