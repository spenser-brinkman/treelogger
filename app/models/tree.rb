class Tree < ApplicationRecord

  belongs_to :species
  belongs_to :user
  belongs_to :property
  
  has_many :inspections
  has_many :surveys, through: :inspections
  accepts_nested_attributes_for :species

  validates_presence_of :name
  validates_presence_of :species

end