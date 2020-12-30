class Survey < ApplicationRecord

  validates_presence_of :date
  
  belongs_to :property
  has_many :inspections
  has_many :trees, through: :inspections

end
