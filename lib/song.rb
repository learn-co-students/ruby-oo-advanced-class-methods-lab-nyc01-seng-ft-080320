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
    #binding.pry
    song = self.new
    @@all << song
    return song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    return new_song
  end

  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    @@all << song
    return song
  end

  def self.find_by_name(query)
    song = @@all.find do |song|
      song.name == query
    end
    song
  end

  def self.find_or_create_by_name (query)
    found_song = self.find_by_name(query)
    song = found_song ? found_song : self.create_by_name(query)
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    song_info = filename.split(" - ")
    song_name = song_info[1].split(".")[0]
    art_name = song_info[0]
    song = self.create_by_name(song_name)
    song.artist_name = art_name
    return song

  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
  end

  def self.destroy_all
    @@all.clear
  end
end
