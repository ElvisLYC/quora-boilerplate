class Question < ActiveRecord::Base
  validates :question, uniqueness: true
  # belongs_to :User

end
