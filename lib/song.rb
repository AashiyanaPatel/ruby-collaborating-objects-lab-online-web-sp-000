class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end
  
  def self.new_by_filename(filename)
    split_name = filename.split(" - ")
    song = self.new(plit_name[1])
    artist = Artist.find_or_create_by_name(name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    self.artist = artist
    artist.add_song(self)
  end
end
