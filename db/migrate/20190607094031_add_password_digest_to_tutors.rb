class AddPasswordDigestToTutors < ActiveRecord::Migration[5.2]
  def change
    add_column :tutors, :password_digest, :string
  end
end
