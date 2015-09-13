class CreateFontsets < ActiveRecord::Migration
  def change
    create_table :fontsets do |t|
      t.string :name
      t.integer :l1font_id
      t.integer :l2font_id
      t.integer :l3font_id

      t.timestamps
    end
  end
end
