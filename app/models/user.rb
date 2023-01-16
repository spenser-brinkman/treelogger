class User < ApplicationRecord
  
  validates :name, presence: true
  validate :password_complexity
  validates_confirmation_of :password
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, message: "is invalid." },
              uniqueness: { case_sensitive: false },
              length: { minimum: 4, maximum: 254 }
  
  has_secure_password

  has_many :properties
  has_many :trees, through: :properties
  has_many :surveys, through: :properties
  has_many :inspections, through: :surveys
  
  def password_complexity
    # return if password.blank? || password =~ /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,30}$/
    return if password.blank? || password =~ /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/
    errors.add :password, "does not meet requirements."
  end

end