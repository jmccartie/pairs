class CreateWaivers < ActiveRecord::Migration
  def change
    create_table :waivers do |t|
      t.integer :address_id
      t.boolean :completed

      t.timestamps
    end
  end
end
