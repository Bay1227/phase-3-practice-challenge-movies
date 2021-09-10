class Role < ActiveRecord::Base
  belongs_to :movie
  belongs_to :actor

  def credit 
    "#{character_name}: Played by #{actor.name}"
  end 
    
end