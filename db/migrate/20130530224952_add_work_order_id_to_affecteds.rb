class AddWorkOrderIdToAffecteds < ActiveRecord::Migration
  def change
    add_column :affecteds, :work_order_id, :integer
  end
end
