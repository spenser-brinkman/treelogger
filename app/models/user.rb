class User < ApplicationRecord
  
  validates :name, presence: true
  validates_confirmation_of :password
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create },
              uniqueness: { case_sensitive: false },
              length: { minimum: 4, maximum: 254 }
  
  has_secure_password

  has_many :properties
  has_many :trees, through: :properties
  has_many :surveys, through: :properties
  has_many :inspections, through: :surveys
  
end