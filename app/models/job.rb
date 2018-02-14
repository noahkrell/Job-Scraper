class Job < ApplicationRecord
  validates :link, uniqueness: true
  acts_as_votable

  def age
    time = self.post_time

    if time.empty?
      return 0
    elsif time.include?("hour") || time.include?("minutes")
      return 1
    elsif time.include?("1 day")
      return 2
    elsif time.include?("2 days")
      return 3
    elsif time.include?("3 days")
      return 4
    elsif time.include?("4 days")
      return 5
    elsif time.include?("5 days")
      return 6
    elsif time.include?("6 days")
      return 7
    elsif time.include?("1 week")
      return 8
    elsif time.include?("2 weeks")
      return 9
    end
  end

end
