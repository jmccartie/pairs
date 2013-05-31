class ChangeWorkOrderPhoneType < ActiveRecord::Migration
  def up
    change_column :work_orders, :phone, :string
  end

  def down
    change_column :work_orders, :phone, :integer
  end
end
