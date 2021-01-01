class Inspection < ApplicationRecord

  belongs_to :survey
  belongs_to :tree

  validates_presence_of :height, :dbh, :foliage

end