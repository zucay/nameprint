class CreateFonts < ActiveRecord::Migration
  def change
    create_table :fonts do |t|
      t.string :font_family
      t.float :font_size, :default=>12
      t.string :heart_font_family
      t.float :heart_font_size, :default=>12
      t.string :star_font_family
      t.float :star_font_size, :default=>12
      t.string :cross_font_family
      t.float :cross_font_size, :default=>12

      t.timestamps
    end
  end
end
