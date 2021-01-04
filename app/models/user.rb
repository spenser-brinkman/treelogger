class User < ApplicationRecord
  
  validates :name, presence: true
  validate :password_complexity
  validates_confirmation_of :password
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create },
              uniqueness: { case_sensitive: false },
              length: { minimum: 4, maximum: 254 }
  
  has_secure_password

  has_many :properties
  has_many :trees, through: :properties
  has_many :surveys, through: :properties
  has_many :inspections, through: :surveys
  
  def password_complexity
    return if password.blank? || password =~ /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,70}$/
    errors.add :password, "should be 8-70 characters with at least one uppercase letter, one lowercase letter, one number and one special character."
  end

end