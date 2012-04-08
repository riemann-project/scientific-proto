class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.integer :user_id
      t.text :content
      t.integer :discussable_id
      t.string :discussable_type

      t.timestamps
    end
  end
end
