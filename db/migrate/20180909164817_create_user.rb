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
      t.string :question
      t.belongs_to :user, index: true
      t.timestamps
    end
  end

end
