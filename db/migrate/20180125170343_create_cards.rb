class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :name, null: false
      t.string :identification, null: false
      t.string :hierarchy, null: false
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
      t.string :blood_type, null: false
      t.string :blood_factor, null: false
      t.boolean :carry_weapon, null: false
      t.string :print_locale, null: false
      t.date :print_date, null: false
      t.date :expire_date, null: false
      t.string :card_number, null: true
      t.boolean :returned_card, null: false, default: false
      t.references :card_request, foreign_key: true
      t.references :card_status, foreign_key: true

      t.timestamps
    end
  end
end
