class CreateUsefuls < ActiveRecord::Migration
  def change
    create_table :usefuls do |t|
      t.integer :user_id
      t.integer :reference_id

      t.timestamps
    end
  end
end
