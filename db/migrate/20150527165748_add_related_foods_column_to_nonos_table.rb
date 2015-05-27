class AddRelatedFoodsColumnToNonosTable < ActiveRecord::Migration
  def change
    add_column :nonos, :related_foods, :string
  end
end
