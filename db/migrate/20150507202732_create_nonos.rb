class CreateNonos < ActiveRecord::Migration
  def change
    create_table :nonos do |t|
      t.string :name

      t.timestamps
    end
  end
end
