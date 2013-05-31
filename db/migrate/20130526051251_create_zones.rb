class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.string :zone
      t.string :desc

      t.timestamps
    end
  end
end
