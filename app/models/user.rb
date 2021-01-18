# frozen_string_literal: true

require "uri"

class User < ApplicationRecord
  has_secure_password validations: false

  before_create :lowercase_email
  before_validation :lowercase_email
  validates :name, presence: true, unless: :is_guest
  validates :email, presence: true, 
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "Must be a valid email format" }
  validates :email, uniqueness: true, unless: :is_guest
  validates :password, length: { minimum: 5 }, unless: :is_guest
  validates_confirmation_of :password, unless: :is_guest
  validates :password, presence: false, if: :is_guest

  has_many :orders, dependent: :nullify

  def self.authenticate_with_email(email, password)
    user = User.find_by(email: email.strip.downcase)
    return user if user&.authenticate(password)
  end

  # Prevent emails from being case-sensitive by only storing lowercase, stripped versions
  def lowercase_email
    self.email = email.strip.downcase if email
  end
end
