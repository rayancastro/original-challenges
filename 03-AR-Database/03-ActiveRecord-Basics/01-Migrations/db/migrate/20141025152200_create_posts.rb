class CreatePosts < ActiveRecord::Migration[5.1]
  def up
    create_table :posts do |t|
      t.string     :title
      t.string     :url
      t.timestamps
      t.timestamps
    end
  end
end
