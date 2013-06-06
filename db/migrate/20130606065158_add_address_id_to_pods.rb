class AddAddressIdToPods < ActiveRecord::Migration
  def change
    add_column :pods, :address_id, :integer
  end
end
