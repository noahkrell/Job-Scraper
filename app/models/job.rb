class Job < ApplicationRecord
  validates :link, uniqueness: true
  acts_as_votable
end
