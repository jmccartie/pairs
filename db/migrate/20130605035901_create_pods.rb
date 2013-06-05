class CreatePods < ActiveRecord::Migration
  def change
    create_table :pods do |t|
      t.string :title
      t.text :desc
      t.hstore :properties
      t.text :notice

      t.timestamps
    end
  end
end
