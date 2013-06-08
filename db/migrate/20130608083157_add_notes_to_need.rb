class AddNotesToNeed < ActiveRecord::Migration
  def change
    add_column :needs, :notes, :text
  end
end
