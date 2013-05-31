class CreateWoStatuses < ActiveRecord::Migration
  def change
    create_table :wo_statuses do |t|
      t.string :status
      t.string :desc

      t.timestamps
    end
  end
end
