class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :title
      t.string :desc

      t.timestamps
    end
  end
end
