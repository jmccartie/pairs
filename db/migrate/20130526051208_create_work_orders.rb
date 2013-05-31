class CreateWorkOrders < ActiveRecord::Migration
  def change
    create_table :work_orders do |t|
      t.integer :zone_id
      t.string :first_name
      t.string :last_name
      t.integer :phone
      t.string :email
      t.integer :address_id
      t.integer :waiver_id
      t.integer :wo_status_id

      t.timestamps
    end
  end
end
