class User < ApplicationRecord
  validates :name, presence: true
  validate :password_complexity
  validates_confirmation_of :password
  validates :email,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, message: 'is invalid.' },
            uniqueness: { case_sensitive: false, message: 'is associated with an existing account.' },
            length: { minimum: 4, maximum: 254 }

  has_secure_password

  has_many :properties
  has_many :trees, through: :properties
  has_many :surveys, through: :properties
  has_many :inspections, through: :surveys

  def password_complexity
    # pages.nist.gov/800-63-3 favors password length over complexity
    return if password.blank? || password =~ /\A(?=.*\S).{8,256}\z/

    errors.add :password, 'must contain at least 8 characters.'
  end
end
