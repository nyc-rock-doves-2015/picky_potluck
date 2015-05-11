class UnregisteredEmails < ActiveRecord::Migration
  def change
    create_table :unregistered_emails do |t|
      t.string :name, null: false
      t.references :party

      t.timestamps
    end
  end
end
