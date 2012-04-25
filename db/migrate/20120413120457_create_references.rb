class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.integer :user_id
      t.integer :problem_id
      t.text :content

      t.timestamps
    end
  end
end
