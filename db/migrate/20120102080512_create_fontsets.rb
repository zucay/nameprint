class CreateFontsets < ActiveRecord::Migration
  def change
    create_table :fontsets do |t|
      t.string :name
      t.integer :l1
      t.integer :l2
      t.integer :l3

      t.timestamps
    end
  end
end
