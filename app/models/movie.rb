class Movie < ActiveRecord::Base
  has_many :roles
  has_many :actors, through: :roles 

  def cast_role(actor, character_name, salary)
    Role.create(character_name: character_name, salary: salary, actor_id: actor.id, movie_id: self.id)
  end 

  def all_credits
    self.roles.map(&:credit)
  end 

  def fire_actor(actor)
    role = self.roles.find_by_actor_id(actor.id)
    role.destroy if role   
  end 
end