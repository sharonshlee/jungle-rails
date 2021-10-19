class User < ActiveRecord::Base

  has_secure_password

  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :email, presence: true, 
                    # uniqueness: true
                    uniqueness: { case_sensitive: false }
                    # format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true
  
end
