require_relative '../config/environment.rb'


a1 = Artist.new("Artist1", 1)
a2 = Artist.new("Artist2", 1)

g1 = Gallery.new("Gallery1", "City1")

p1 = a2.create_painting("Painting1", 10, g1)


binding.pry

puts "Bob Ross rules."
