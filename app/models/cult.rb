class Cult
  
  attr_reader :name, :location, :founding_year, :slogan

  @@all = [] # holds all instances of Cult
  
  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @@all << self # on init, add self to all instances of Cult
  end

  def followers # returns array of all followers of this cult
    bloods = BloodOath.all.select {|blood| blood.cult == self}
    return bloods.map {|blood| blood.follower}
  end

  def recruit_follower(follower, initiation_date) # adds follower to cult's followers by creating new bloodoath
    BloodOath.new(self, follower, initiation_date)
    return followers
  end

  def cult_population # returns total number of followers
    return self.followers.length
  end

  def average_age # returns average age of this cults followers
    ages = followers.map {|follower| follower.age}
    return (ages.sum / ages.length).to_f
  end 

  def my_followers_mottos # returns mottos of followers
    return followers.map {|follower| follower.life_motto}
  end

  def self.all # returns all instances of Cult
    return @@all
  end

  def self.find_by_name(name) # returns Cult matching given name
    return Cult.all.find {|cult| cult.name == name}
  end

  def self.find_by_location(location) # returns Cult matching giving location
    return Cult.all.select {|cult| cult.location == location}
  end

  def self.find_by_founding_year(year) # returns Cult matching founding year
    return Cult.all.find {|cult| cult.founding_year == year}
  end
  
  def self.least_popular # returns Cult with least amount of followers
    return Cult.all.min_by {|cult| cult.cult_population}
  end

  def self.most_common_location # returns location that has the most cults 
    locations = Cult.all.map {|cult| cult.location} # array of all locations
    frequencies = locations.each_with_object(Hash.new(0)) {|location, hash| hash[location] += 1} # hash where keys are locations and values are how many cults 
    return (frequencies.max {|(k1, v1), (k2, v2)| v1 <=> v2})[0] # max returns 2-element array where 
                                                                #first element is the location with the most cults
                                                                # and second is num of cults, return first element, location
  end


end
