class Cult
  
  attr_reader :name, :location, :founding_year, :slogan
  attr_accessor :followers

  @@all = [] # holds all instances of Cult
  
  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @followers = []
    @@all << self # on init, add self to all instances of Cult
  end

  def recruit_follower(follower)
    return self.followers << follower
  end

  def cult_population
    return self.followers.length
  end

  def self.all
    return @@all
  end

  def self.find_by_name(name)
    return Cult.all.find {|cult| cult.name == name}
  end

  def self.find_by_location(location)
    return Cult.all.select {|cult| cult.location == location}
  end

  def self.find_by_founding_year(year)
    return Cult.all.find {|cult| cult.founding_year == year}
  end

end
