class CreateMilitaries < ActiveRecord::Migration[5.1]
  def change
    create_table :militaries do |t|
      t.string :name, null: false
      t.string :identification, null: false
      t.references :hierarchy, null: false, foreign_key: true
      t.string :father_name
      t.string :mother_name
      t.date :born_date, null: false
      t.string :registration, null: false
      t.string :naturalness, null: false
      t.string :vote_number, null: false
      t.string :vote_zone, null: false
      t.string :vote_section, null: false
      t.string :cpf, null: false
      t.string :digital_factor, null: false
      t.integer :blood_type, null: false
      t.integer :blood_factor, null: false
      t.boolean :carry_weapon, null: false

      t.timestamps
    end
  end
end
