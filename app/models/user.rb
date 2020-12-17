class User < ApplicationRecord
  
  validates :name, presence: true, unless: ->(user){user.email.present?}
  validates :email, presence: true, unless: ->(user){user.name.present?}
  validates :email, uniqueness: true
  validates_confirmation_of :password
  
  has_secure_password

  has_many :properties
  has_many :surveys, through: :properties
  has_many :tree_surveys, through: :surveys
  has_many :trees, through: :tree_surveys
  
end