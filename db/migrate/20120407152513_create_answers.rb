class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :problem_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
