class CreateHierarchies < ActiveRecord::Migration[5.1]
  def change
    create_table :hierarchies do |t|
      t.string :name
      t.string :acronym
      t.integer :rank

      t.timestamps
    end
  end
end
