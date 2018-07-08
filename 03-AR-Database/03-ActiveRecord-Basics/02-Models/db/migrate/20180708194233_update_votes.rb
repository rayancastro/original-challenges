class UpdateVotes < ActiveRecord::Migration[5.1]
  def up
    change_column :posts, :votes, :integer, default: 0
  end
end
