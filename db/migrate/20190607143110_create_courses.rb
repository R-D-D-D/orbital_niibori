class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :content
      t.references :tutor, foreign_key: true
      t.integer :rating

      t.timestamps
    end
    add_index :courses, [:tutor_id, :created_at]
  end
end
