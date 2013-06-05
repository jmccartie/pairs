class RemoveRoles < ActiveRecord::Migration
  def up
    drop_table :roles
    add_column :users, :role, :string
    remove_column :users, :role_id
  end

  def down
    add_column :users, :role_id, :integer
    remove_column :users, :role
     create_table "roles", :force => true do |t|
      t.string   "title"
      t.string   "desc"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
    end
  end
end
