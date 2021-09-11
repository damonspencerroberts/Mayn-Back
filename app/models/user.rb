class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  def self.authenticate(email, password)
    user = User.find_for_authentication(email: email)
    return nil if user.nil?

    user.valid_password?(password) ? user : nil
  end
end
