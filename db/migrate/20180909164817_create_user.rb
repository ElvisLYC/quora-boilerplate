
class CreateUser < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :password_digest
      t.timestamps
    end

    create_table :questions do |t|
      t.belongs_to :user, :foreign_key => :user_id
      t.integer :user_id
      t.string :name
      t.string :email
      t.string :question
      t.datetime :published_at
      t.timestamps
    end
  end

end
