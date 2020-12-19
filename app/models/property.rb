class Property < ApplicationRecord

  validates :title, presence: true
  
  belongs_to :user
  has_many :surveys
  has_many :tree_surveys, through: :surveys
  has_many :trees, through: :tree_surveys

end
