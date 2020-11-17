require 'uri'

class User < ActiveRecord::Base

  has_secure_password

  before_create :lowercase_email
  before_validation :lowercase_email
  validates :fname, presence: true
  validates :lname, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP, message: 'Must be a valid email format'}
  validates :password, length: {minimum: 5}

  def self.authenticate_with_email(email, password)
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      return user
    end
  end

    # Prevent emails from being case-sensitive by only storing lowercase, stripped versions
  def lowercase_email
    if self.email
      self.email = self.email.strip.downcase
    end
  end

end