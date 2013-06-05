class RenameWorkOrderToNeed < ActiveRecord::Migration
  def up
    rename_table :work_orders, :needs
    rename_column :affecteds, :work_order_id, :need_id
  end

  def down
    rename_column :affecteds, :need_id, :work_order_id
    rename_table :needs, :work_orders
  end
end
