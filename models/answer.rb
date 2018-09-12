class Answer < ActiveRecord::Base
  validates :answer, uniqueness: true


end
