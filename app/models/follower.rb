class Follower

  attr_reader :name, :age, :life_motto

  @@all = [] # holds all instances of Follower

  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    @@all << self # on init, add instance to all instances of Follower
  end

  def cults # returns all cults self-follower follows
    bloods = BloodOath.all.select {|blood| blood.follower == self}
    return bloods.map {|blood| blood.cult}
  end

  def join_cult(cult, initiation_date) # makes new BloodOath between given cult and self-follower and returns all cults self-follower follows
    BloodOath.new(cult, self, initiation_date)
    return cults
  end

  def my_cult_slogans # returns array of all slogans of the cults this follower follows
    return cults.map {|cult| cult.slogan}
  end

  def self.all # returns all instances of Follower
    return @@all
  end

  def self.of_a_certain_age(age) # returns follower(s) of a certain age
    return Follower.all.select {|follower| follower.age >= age}
  end

  def self.most_active # return follower instance who follows the most cults
    return follower_numCults.max {|(key1,val1),(key2,val2)| val1 <=> val2} 
  end

  def self.top_ten # returns array of top ten Followers by num of cults, sorted in descending order
    return (Follower.all.sort {|follower1, follower2| follower2.cults.length <=> follower1.cults.length})[0..9]
  end

  private
  def follower_numCults # returns hash where keys are instances of followers and values are num of Cults that follower is in
    return BloodOath.all.each_with_object(Hash.new(0)) {|blood, hash| hash[blood.follower] += 1}
  end

end
