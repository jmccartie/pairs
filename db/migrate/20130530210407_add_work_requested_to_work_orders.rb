class AddWorkRequestedToWorkOrders < ActiveRecord::Migration
  def change
    add_column :work_orders, :work_requested, :text
    add_column :work_orders, :other_needs, :text
  end
end
