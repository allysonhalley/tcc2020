class CreateMilitaries < ActiveRecord::Migration[5.1]
  def change
    create_table :militaries do |t|
      t.string :name
      t.string :identification
      t.references :hierarchy, foreign_key: true
      t.string :father_name
      t.string :mother_name
      t.date :born_date
      t.string :registration
      t.string :naturalness
      t.string :vote_number
      t.string :vote_zone
      t.string :vote_section
      t.string :cpf
      t.string :digital_factor
      t.integer :blood_type
      t.integer :blood_factor
      t.boolean :carry_weapon

      t.timestamps
    end
  end
end
