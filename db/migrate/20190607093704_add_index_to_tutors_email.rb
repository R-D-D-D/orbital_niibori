class AddIndexToTutorsEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :tutors, :email, unique: true
  end
end
