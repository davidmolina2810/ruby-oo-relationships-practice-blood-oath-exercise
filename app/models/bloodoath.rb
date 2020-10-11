class BloodOath
  
  attr_accessor :cult, :follower, :initiation_date

  @@all = [] # holds all instances of BloodOath

  def initialize(cult, follower, initiation_date)
    @cult = cult
    @follower = follower
    @initiation_date = initiation_date
    @@all << self # on init, add instance to all instances of BloodOath
  end

  def self.all 
    return @@all
  end

end
