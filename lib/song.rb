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
    self.all << song
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title)
    self.all.find {|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
    if self.find_by_name(title) == nil
      self.create_by_name(title)
    else
      self.find_by_name(title)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    file_array = file_name.split(" - ")
    file_array[1] = file_array[1].chomp(".mp3")
    song = self.new
    song.name = file_array[1]
    song.artist_name = file_array[0]
    song
  end


  def self.create_from_filename(file_name)
    usuable_file = self.new_from_filename(file_name)
    song = self.create
    song.name = usuable_file.name
    song.artist_name = usuable_file.artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
