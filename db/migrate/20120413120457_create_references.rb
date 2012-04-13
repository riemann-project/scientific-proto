class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.integer :user_id
      t.integer :referable_id
      t.string :referable_type
      t.text :content

      t.timestamps
    end
  end
end
