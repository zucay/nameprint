class CreateFontsets < ActiveRecord::Migration
  def change
    create_table :fontsets do |t|
      t.string :name
      t.string :base_name
      t.float :base_size
      t.string :heart_name
      t.float :heart_size
      t.string :cross_name
      t.float :cross_size
      t.string :star_name
      t.float :star_size

      t.timestamps
    end
  end
end
