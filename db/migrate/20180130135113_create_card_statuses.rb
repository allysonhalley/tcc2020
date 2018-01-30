class CreateCardStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :card_statuses do |t|
      t.string :describe

      t.timestamps
    end
  end
end
