class CreateProblemTrees < ActiveRecord::Migration
  def change
    create_table :problem_trees do |t|
      t.integer :problem
      t.string :university
      t.string :department
      t.string :course
      t.integer :grade
      t.string :name
      t.date :date

      t.timestamps
    end
  end
end
