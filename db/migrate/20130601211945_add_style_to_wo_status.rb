class AddStyleToWoStatus < ActiveRecord::Migration
  def change
    add_column :wo_statuses, :style, :string
  end
end
