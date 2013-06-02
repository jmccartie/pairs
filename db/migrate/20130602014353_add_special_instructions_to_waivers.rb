class AddSpecialInstructionsToWaivers < ActiveRecord::Migration
  def change
    add_column :waivers, :special_instructions, :text
  end
end
