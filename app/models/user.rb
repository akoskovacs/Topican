class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :name, :email, :password, :password_confirmation
  validates :name, :presence => true

  #email_regex = /\A[\w+\-\.]+@[a-z\d\-\.]+\.[a-z]+\z\i/
  validates :email, :presence => true,
                    :uniqueness => true,
                    #:format => { :with => email_regex },
                    :length => { :minimum => 3 }
end
