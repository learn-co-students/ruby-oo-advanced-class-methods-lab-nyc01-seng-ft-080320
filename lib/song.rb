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
    song = Song.new  
    song.save   ##creates a new object and shovels it into the 'self.class.all' array
    song    #returns the array
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name   ##creates a new song with a name as an argument
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.save      ##invokes save on a new object to move it into the self class array
    song.name = name  ##sets the songs name equal to the name argument given
    song ##returns the song
  end

  
  def self.find_by_name(name)
     @@all.find{ |song| song.name == name}   ##find method asking the element if its :name is equal to its :name
  end

  def self.find_or_create_by_name(name)  
    array = self.find_by_name(name)  ##invokes our find_by_name method with an argument of the name
    return array if array != nil   ##tells you that if your search ISNT empty, tells the user its there
    self.create_by_name(name)   ##if it isnt, invokes create_by_name method
  end
  
  def self.alphabetical
    self.all.sort_by { |song| song.name } ##sort_by method using our string
  end

  def self.new_from_filename(filename)
    filename = filename[0..-5] ##need to add the minus to remove the last 5 characters in the string
    newname = filename.split(" - ") ##splitting the string into two parts, artist name and song
    song = Song.new ##create new instance of song
    song.artist_name = newname[0]  ##first part is the artist name
    song.name = newname[1] ##second part is the name
    song  ##returns the song
    #binding.pry
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)  ##invokes the new from filename method 
    song.save #saves the instance created by above method
    song  #returns our new input
  end

  def self.destroy_all
    self.all.clear ##from advanced methods
  end

end
