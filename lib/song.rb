
File filter... 
 45  lib/artist.rb 
@@ -0,0 +1,45 @@
class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.all
    @@all
  end

  def self.create(name)
    artist = self.new(name)
    artist.name = name
    artist
  end

  def self.find(name)
    self.all.detect { |artist| artist.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find(name) || self.create(name)
  end

  def add_song(song)
    @songs << song
  end

  def print_songs
    songs.each { |song| puts song.name }
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end
end 
 15  lib/mp3_importer.rb 
@@ -0,0 +1,15 @@
class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir[@path+"/*.mp3"].map { |file| file.split("/").last }
  end

  def import
    files.each { |file| Song.new_by_filename(file) }
  end
end 


