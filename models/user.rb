# require_relative './config/init.rb'

class User < ActiveRecord::Base
# implement your Student model here
# validates :email, :format => { :with => /\w+[\.]\w+[@]\w+[.]\w+/}, uniqueness: true
  validates :email, :format => { :with => /\w+[@]\w+[.]\w{1}\w+/}, uniqueness: true
  validates :name, :format => { :with => /\w+[^ ]/}, uniqueness: true
  has_secure_password
  # has_many :Question
#implement association here
end

# class Question < User
#   belongs_to :user, :foreign_key => :user_id
# end

# class Question < User
#
#   belongs_to :User
#
# end
