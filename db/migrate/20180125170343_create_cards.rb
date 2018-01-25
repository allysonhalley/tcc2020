class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :identification
      t.string :hierarchy
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
      t.string :blood_type
      t.string :blood_factor
      t.boolean :carry_weapon
      t.string :print_locale
      t.date :print_date
      t.date :expire_date
      t.string :card_number
      t.boolean :returned_card
      t.references :card_request, foreign_key: true
      t.references :card_status, foreign_key: true

      t.timestamps
    end
  end
end
