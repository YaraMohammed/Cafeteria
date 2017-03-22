class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.integer :room
      t.date :date

      t.timestamps
    end
  end
end
