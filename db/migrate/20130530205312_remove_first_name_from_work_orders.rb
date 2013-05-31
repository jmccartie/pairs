class RemoveFirstNameFromWorkOrders < ActiveRecord::Migration
  def change
    remove_column :work_orders, :first_name
    remove_column :work_orders, :last_name
    remove_column :work_orders, :phone
    remove_column :work_orders, :email
    remove_column :work_orders, :address_id
  end
end
