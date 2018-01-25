class CreateCardRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :card_requests do |t|
      t.string :military_registration
      t.string :document_reference
      t.integer :reason_request
      t.boolean :canceled, null: false, default: false

      t.timestamps
    end
  end
end
