class CreateAffecteds < ActiveRecord::Migration
  def change
    create_table :affecteds do |t|

      t.timestamps
    end
  end
end
