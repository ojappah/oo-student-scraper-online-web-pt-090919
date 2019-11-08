class Friend

  attr_accessor :name, :address, :phone, :birthday, :age

  @@all = []

  def initialize(friend_hash)
    friend_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@all << self
  end

  def self.create_from_collection(friends_array)
    friends_array.each do |friend_hash|
      friend.new(friend_hash)
    end
  end

  def self.all
    @@all
  end
end
