class CreateProblemImages < ActiveRecord::Migration
  def change
    create_table :problem_images do |t|
      t.integer :problem_id
      t.integer :user_id
      t.string :image

      t.timestamps
    end
  end
end
