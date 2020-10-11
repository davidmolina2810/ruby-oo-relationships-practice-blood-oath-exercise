require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

cult1 = Cult.new("Queen", "NYC, NY", 1985, "Anyway you want it")

david = Follower.new("David", 22, "Life. Motto.")

blood1 = BloodOath.new(cult1, david, "_2020-10-11_")

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits