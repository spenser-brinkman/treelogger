class Property < ApplicationRecord
  validates :title, presence: true

  belongs_to :user

  has_many :trees
  has_many :surveys
  has_many :inspections, through: :surveys
end
