class CreateUsefuls < ActiveRecord::Migration
  def change
    create_table :usefuls do |t|
      t.intetger :user_id
      t.integer :answer_id

      t.timestamps
    end
  end
end
