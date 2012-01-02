class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :l1
      t.string :l2
      t.string :l3
      t.integer :fontset_id
      t.integer :project_id
      t.boolean :done
      t.string :lot

      t.timestamps
    end
  end
end
