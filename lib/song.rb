require 'pry';

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

    # yo I wasted a ton of time trying to pass name, artist name as args and binding them to song eg., song.name = name;
  def self.create
    song = self.new;
    song.save;
    song;
  end

  def self.create_by_name(name)
    song = self.new;
    song.name = name;
    song.save;
    song;
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      return find_by_name(name)
    else
      return create_by_name(name);
    end
  end
  # https://stackoverflow.com/questions/11531061/how-do-you-sort-an-array-alphabetically-using-sort-by-in-ruby
  # I think by putting song.name in the block its auto assigning a key to sort by based on the alphabet but I ref'd this SO
  # post above!!
  def self.alphabetical
    sorted_songs = @@all.sort_by{|song| song.name}
    return sorted_songs;
  end

  def self.new_from_filename(file_name)
    song = Song.create;
    arrayFile = file_name.split(' - ');
    song.name = arrayFile[1].split('.')[0]
    song.artist_name = arrayFile[0]
    return song;
  end

  def self.create_from_filename(file_name)
    song = new_from_filename(file_name);
    return song;
  end

  def self.new_by_name(name)
    song = self.new;
    song.name = name;
    song;
  end
  def self.destroy_all()
    self.all.clear;
  end
end

