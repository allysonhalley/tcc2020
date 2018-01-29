class CreateCardRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :card_requests do |t|
      t.string :military_registration, null: false
      t.string :document_reference, null: false
      t.integer :reason_request, null: false
      t.boolean :canceled, null: false, default: false

      t.timestamps
    end
  end
end
