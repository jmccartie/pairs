class AddAddressIdToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :address_id, :integer
  end
end
