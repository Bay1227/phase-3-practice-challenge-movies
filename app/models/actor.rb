class Actor < ActiveRecord::Base
  has_many :roles
  has_many :movies, through: :roles 

  def total_salary
    self.roles.sum(&:salary)
    # self.roles.map(&:salary).sum
  end 

  def blockbusters
    self.movies.filter {|movie| movie.box_office_earnings > 50000000}
  end 

  def self.most_successful
    Actor.all.sort_by{|actor| actor.total_salary}.last
  end    
end