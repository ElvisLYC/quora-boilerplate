class Answer < ActiveRecord::Base
  validates :answer, uniqueness: true
  belongs_to :user
  belongs_to :question
  has_many :votes

end
