class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :loggable_id
      t.string :loggable_type
      t.integer :user_id

      t.timestamps
    end
  end
end
