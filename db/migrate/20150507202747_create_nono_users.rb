class CreateNonoUsers < ActiveRecord::Migration
  def change
    create_table :nono_users do |t|
      t.references :user, null: false
      t.references :nono, null: false

      t.timestamps
    end
  end
end
