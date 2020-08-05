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
    created_song = Song.new
    created_song.save
    return created_song
  end

  def self.new_by_name(song)
    created_song = Song.new
    created_song.name = song
    return created_song
  end

  def self.create_by_name(song)
    created_song = self.new_by_name(song)
    created_song.save
    return created_song
  end

  def self.find_by_name(song_search)
    Song.all.find {|song| song.name == song_search}
  end

  def self.find_or_create_by_name(song)
    return Song.create_by_name(song) unless Song.find_by_name(song)
    return Song.find_by_name(song)
  end

  def self.alphabetical
    Song.all.sort_by {|ele| ele.name}
  end

  def self.new_from_filename(song_file)
    artist_song = song_file.split(/[-.]/)
    artist = artist_song[0].strip
    song = artist_song[1].strip
    new_song = Song.new
    new_song.name = song
    new_song.artist_name = artist
    new_song.save
    return new_song
  end

  def self.create_from_filename(song_file)
    created =Song.new_from_filename(song_file)
    created.save
  end

  def self.destroy_all
    self.all.clear
  end
end
