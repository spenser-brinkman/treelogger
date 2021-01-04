class Survey < ApplicationRecord

  validates_presence_of :date
  
  has_many :inspections
  has_many :trees, through: :inspections
  belongs_to :user
  belongs_to :property

end
