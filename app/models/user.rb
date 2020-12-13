require "uri"

class User < ApplicationRecord
  has_secure_password

  before_create :lowercase_email
  before_validation :lowercase_email
  validates :name, presence: true, unless: :is_guest?
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Must be a valid email format" }
  validates :password, length: { minimum: 5 }, unless: :is_guest?
  validates :password, presence: false, if: :is_guest?

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
