require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

cult1 = Cult.new("Queen", "NYC, NY", 1985, "Anyway you want it")
cult2 = Cult.new("XYZ", "Salt Lake City", 1770, "CTR")
cult3 = Cult.new("JW", "NYC, NY", 1000, "People")

david = Follower.new("David", 22, "Life. Motto.")
ash = Follower.new("Ash", 21, "Dogs. Cats.")

david.join_cult(cult1, '_1999-10-14_')
david.join_cult(cult2, '_2005-06-10_')
ash.join_cult(cult2, '_2020-04-20_')
ash.join_cult(cult3, "_2020-06-28_")
david.join_cult(cult3, '_2020-09-11_')



binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits