class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.text :content
      t.string :title
      t.integer :user_id
      t.integer :view

      t.timestamps
    end
  end
end
