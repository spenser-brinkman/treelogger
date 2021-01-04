class Survey < ApplicationRecord

  validates :date, presence: true, uniqueness: {scope: :property_id}
  
  has_many :inspections
  has_many :trees, through: :inspections
  belongs_to :user
  belongs_to :property

end
