class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :abbr
      t.text :template
      t.integer :num
      t.timestamps
    end
  end
end
