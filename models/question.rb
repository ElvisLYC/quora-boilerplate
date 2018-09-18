class Question < ActiveRecord::Base
  validates :question, uniqueness: true
  # belongs_to :User
  belongs_to :user
  has_many :answers
  has_many :votes
end
