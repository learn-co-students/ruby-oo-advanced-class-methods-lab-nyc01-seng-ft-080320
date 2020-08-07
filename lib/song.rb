require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

    # def initialize
    #   @@all << self
    # end
    def save
    self.class.all << self
  end
  #binding.pry

  def self.all
    @@all
  end

def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    Song.all.find do |song|
    song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    Song.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    song_name = (filename.split(" - ")[1]).gsub(".mp3", "")
    artist = (filename.split(" - ")[0])
    new_song = self.new
    new_song.name = song_name
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(filename)
    song_name = (filename.split(" - ")[1]).gsub(".mp3", "")
    artist = (filename.split(" - ")[0])
    new_song = self.new
    new_song.name = song_name
    new_song.artist_name = artist
    new_song.save
    new_song
  end
  
  def self.destroy_all
    Song.all.clear
  end
 
 

end
