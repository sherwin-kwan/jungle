class User < ActiveRecord::Base

  validates :email, presence: true
  validates :password_digest, presence: true

end