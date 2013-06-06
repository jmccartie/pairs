class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :title
      t.text :desc
      t.string :category
      t.integer :pod_id
      t.boolean :pick_up
      t.boolean :drop_off
      t.string :status

      t.timestamps
    end
  end
end
