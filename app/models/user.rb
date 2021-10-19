class User < ActiveRecord::Base

  has_secure_password

  validates :password, presence: true,
                       length: { minimum: 8 }
  validates :password_confirmation, presence: true
  validates :email, presence: true, 
                    uniqueness: { case_sensitive: false }
  validates :name, presence: true

  # def self.authenticate_with_credentials(email, password)
  #   # return user if authentication success
  #   @user = User.find_by_email(email.strip.downcase)
  #   if @user && password
  #     @user
  #   else
  #     nil
  #   end
  # end
  
end
