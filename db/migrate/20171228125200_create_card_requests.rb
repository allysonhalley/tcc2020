class CreateCardRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :card_requests do |t|
      t.string :military_registration
      t.string :document_reference
      t.integer :reason_request

      t.timestamps
    end
  end
end
