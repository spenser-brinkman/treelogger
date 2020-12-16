class Tree < ApplicationRecord

  belongs_to :species
  has_many :tree_surveys
  has_many :surveys, through: :tree_surveys

end
