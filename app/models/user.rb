class User < ActiveRecord::Base
  validates :email, :password, :password_confirmation, :first_name, :last_name,  presence: true

  validates_length_of :password, minimum: 3
  validates_uniqueness_of :email, case_sensitive: false

  has_secure_password
  has_many :reviews

  def full_name
    first_name + ' ' + last_name
  end

  def self.authenticate_with_credentials(email, password)
    user = self.find_by_email email.strip.downcase
    unless !!user
      puts "user #{email.strip.downcase} doesn't exist"
      return false
    end
    return !!user && !!user.authenticate(password.strip)
  end
end
