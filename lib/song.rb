require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end  

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name[0]}
  end

  def self.new_from_filename(filename)
    #binding.pry
    data = filename.split(" - ")
    artist = data[0]
    song_name = data[1].delete_suffix(".mp3")

    song = self.new
    song.artist_name = artist
    song.name = song_name

    self.all << song
    song
  end

  def self.create_from_filename(filename)
    data = filename.split(" - ")
    artist = data[0]
    song_name = data[1].delete_suffix(".mp3")

    song = self.new
    song.artist_name = artist
    song.name = song_name

    self.all << song
    song
  end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

end
