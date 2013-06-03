class AddSignatureToWaivers < ActiveRecord::Migration
  def change
    add_column :waivers, :signature, :text
  end
end
