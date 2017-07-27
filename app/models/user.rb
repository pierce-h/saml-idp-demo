class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :trackable, :validatable

  class << self
    def by_email(email)
      where(email: email).first
    end
  end

  def authenticate(unencrypted_password)
    encrypted_password == password_digest(unencrypted_password)
  end
end
