class CreateHierarchies < ActiveRecord::Migration[5.1]
  def change
    create_table :hierarchies do |t|
      t.string :name, null: false
      t.string :acronym, null: false
      t.integer :rank, null: false

      t.timestamps
    end
  end
end
