class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.integer :student_id
      t.integer :course_id

      t.timestamps
    end
    add_index :subscriptions, :student_id
    add_index :subscriptions, :course_id
    add_index :subscriptions, [:student_id, :course_id], unique: true
  end
end
