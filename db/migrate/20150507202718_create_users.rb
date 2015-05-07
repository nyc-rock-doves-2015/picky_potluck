class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.string :name, null: false
      t.string :photo_url
      t.string :fave

      t.timestamps
    end
  end
end
