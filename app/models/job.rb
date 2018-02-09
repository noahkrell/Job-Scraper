class Job < ApplicationRecord
  validates :link, uniqueness: true
end
