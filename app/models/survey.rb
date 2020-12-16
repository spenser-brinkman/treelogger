class Survey < ApplicationRecord

  belongs_to :property
  has_many :tree_surveys
  has_many :trees, through: :tree_surveys

end
