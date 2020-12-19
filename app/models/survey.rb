class Survey < ApplicationRecord

  validates_presence_of :date
  
  belongs_to :property
  has_many :tree_surveys
  has_many :trees, through: :tree_surveys

end
