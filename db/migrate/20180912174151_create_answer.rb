
class CreateAnswer < ActiveRecord::Migration[5.0]

  def change
    create_table :answers do |t|
      t.belongs_to :question, :foreign_key => :question_id
      t.integer :question_id
      t.string :name
      t.string :email
      t.string :answer
      t.string :question
      t.timestamps
    end
  end
end
