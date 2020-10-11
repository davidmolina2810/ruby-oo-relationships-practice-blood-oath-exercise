class Follower

  attr_reader :name, :age, :life_motto

  @@all = [] # holds all instances of Follower

  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    @@all << self # on init, add instance to all instances of Follower
  end

  def cults
    bloods = BloodOath.all.select {|blood| blood.follower == self}
    return bloods.map {|blood| blood.cult}
  end

  def join_cult(cult)
    cult.recruit_follower(self)
  end

  def self.all 
    return @@all
  end

  def self.of_a_cetain_age(age)
    return Follower.all.select {|follower| follower.age >= age}
  end

end
