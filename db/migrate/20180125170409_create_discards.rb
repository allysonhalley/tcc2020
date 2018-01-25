class CreateDiscards < ActiveRecord::Migration[5.1]
  def change
    create_table :discards do |t|
      t.string :card_number
      t.references :card_request, foreign_key: true
      t.text :reason_discard

      t.timestamps
    end
  end
end
