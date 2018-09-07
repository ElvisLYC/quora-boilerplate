# require_relative './config/init.rb'

class User < ActiveRecord::Base
# implement your Student model here
# validates :email, :format => { :with => /\w+[\.]\w+[@]\w+[.]\w+/}, uniqueness: true
  validates :email, :format => { :with => /\w+[@]\w+[.]\w{1}\w+/}, uniqueness: true

  has_secure_password
  # validates :password, :length => { :minimum => 5 }

end
