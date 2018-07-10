class CreateUserTable < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.timestamps null: false
    end
    add_reference :posts, :user, foreign_key: true
  end
end
