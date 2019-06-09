class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :link
      t.string :uid, index: true
      t.string :title
      t.datetime :published_at
      t.integer :likes
      t.integer :dislikes

      t.timestamps
    end
  end
end
