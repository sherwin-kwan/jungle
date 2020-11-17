class User < ActiveRecord::Base

  has_secure_password

  validates :email, presence: true

  def authenticate_with_email(email, password)
    user = User.find_by_email(email.trim.downcase)
    if user && user.authenticate(password)
      return user
    end
  end

end