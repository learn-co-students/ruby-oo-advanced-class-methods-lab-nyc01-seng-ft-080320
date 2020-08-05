require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song
      song
    else
      song = self.create_by_name(name)
      song
    end
  end

  def self.alphabetical
    alphabetical = @@all.sort_by do |song|
      song.name
    end
    alphabetical.uniq
  end

  def self.new_from_filename(filename)
    song_info = filename.split(" - ")
    song_info[1] = song_info[1].chomp(".mp3")
    song = self.new_by_name(song_info[1])
    song.artist_name = song_info[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
