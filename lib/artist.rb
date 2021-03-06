class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def add_song(song)
    @songs << song
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @all
  end
  
  