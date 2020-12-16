class User < ApplicationRecord
  
  has_secure_password

  validates_presence_of :username, :password
  validates :username, uniqueness: true

  has_many :properties
  has_many :surveys, through: :properties
  has_many :tree_surveys, through: :surveys
  has_many :trees, through: :tree_surveys

end