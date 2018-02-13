class Job < ApplicationRecord
  validates :link, uniqueness: true
  acts_as_votable

  def age
    if self.post_time.empty?
      return 0
    elsif self.post_time.include?("hour")
      return 1
    elsif self.post_time.include?("1 day")
      return 2
    elsif self.post_time.include?("2 days")
      return 3
    elsif self.post_time.include?("3 days")
      return 4
    elsif self.post_time.include?("4 days")
      return 5
    elsif self.post_time.include?("5 days")
      return 6
    elsif self.post_time.include?("6 days")
      return 7
    else
      return 8
    end
  end
end
