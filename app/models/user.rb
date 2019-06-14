class User < ActiveRecord::Base
  # validates :email, :password_digest, :first_name, :last_name,  presence: true
  has_secure_password

  has_many :reviews
end
