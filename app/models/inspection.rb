class Inspection < ApplicationRecord
  belongs_to :survey
  belongs_to :tree
  belongs_to :user

  validates_presence_of :height, :dbh, :foliage

  scope :tallest, -> { where(height: self.maximum(:height)) }
end
