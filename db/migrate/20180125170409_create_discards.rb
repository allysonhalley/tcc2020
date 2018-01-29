class CreateDiscards < ActiveRecord::Migration[5.1]
  def change
    create_table :discards do |t|
      t.string :card_number, null: false
      t.references :card_request, null: false, foreign_key: true
      t.text :reason_discard, null: false

      t.timestamps
    end
  end
end
