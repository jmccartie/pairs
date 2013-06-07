class AddNotesToPods < ActiveRecord::Migration
  def change
    add_column :pods, :notes, :text
  end
end
