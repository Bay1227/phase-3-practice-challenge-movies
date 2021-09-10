# This will delete any existing rows from the Movie and Actor tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting movie/actor data..."
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

puts "Creating movies..."
mean_girls = Movie.create(title: "Mean Girls", box_office_earnings: 29_000_000)
spice_world = Movie.create(title: "Spice World", box_office_earnings: 151_000_000)

puts "Creating actors..."
lindsay_lohan = Actor.create(name: "Lindsay Lohan")
tina_fey = Actor.create(name: "Tina Fey")
baby_spice = Actor.create(name: "Emma Bunton")
ginger_spice = Actor.create(name: "Geri Halliwell")
scary_spice = Actor.create(name: "Melanie Brown")
sporty_spice = Actor.create(name: "Melanie Chisholm")
posh_spice = Actor.create(name: "Victoria Addams")

puts "Creating roles..."
cady = Role.create(character_name: "Cady Heron", salary: 100000, movie_id: mean_girls.id, actor_id: lindsay_lohan.id)
norbury = Role.create(character_name: "Ms. Norbury", salary: 50000, movie_id: mean_girls.id, actor_id: tina_fey.id)
baby = Role.create(character_name: "Baby Spice", salary: 999999, movie_id: spice_world.id, actor_id: baby_spice.id)




puts "Seeding done!"
puts
puts "Role#actor for Mean Girls:"
puts cady.actor.name
puts "Role#movie for Cady Heron:"
puts cady.movie.title
puts
# puts "Testing movie roles and actors"
# puts mean_girls.roles .map(&:character_name)
# puts
# puts mean_girls.actors.map(&:name)
# puts
puts "Testing Actor roles and movies"
puts tina_fey.roles.map(&:character_name)
puts tina_fey.movies.map(&:title)
puts
puts "Credit for Ms. Norbury:"
puts norbury.credit
puts
# puts "Casting Baby Spice as principal"
principal = mean_girls.cast_role(baby_spice, "Principal", 200000)
# puts principal.movie.title
# puts principal.actor.name 
# puts 
# mg = Movie.find_by_title("Mean Girls")
# puts mean_girls.roles.map(&:character_name)
# puts mean_girls.actors.map(&:name)
# puts
# puts "All credits for Mean Girls"
# puts mean_girls.all_credits
puts
puts "removing ms lohan"
mean_girls.fire_actor(lindsay_lohan)
puts mean_girls.all_credits
spice_world.fire_actor(lindsay_lohan)
puts 
puts "Baby Spice total salary"
puts baby_spice.total_salary
puts
puts "Baby Spice blockbusters"
puts baby_spice.blockbusters.map(&:title)
puts
puts "Most successful actor is ..."
puts Actor.most_successful.name



puts