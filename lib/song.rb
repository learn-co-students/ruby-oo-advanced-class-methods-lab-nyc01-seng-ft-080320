class Song
  attr_accessor :artist_name, :name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all.push(self)
  end
  
  def self.create
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end
  
  def self.find_by_name(song_name)
    self.all.find do |song|
    song.name == song_name
    end
  end
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) or self.create_by_name(song_name)
  end 
  
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(filename)
    fixed_filename = filename.split(/[-.]/)
    song_name = fixed_filename[1].strip
    artist_name = fixed_filename[0].strip
  
    track = self.new
    track.name = song_name
    track.artist_name = artist_name
    track
  end
  
  def self.create_from_filename(filename)
    fixed_filename = filename.split(/[-.]/)
    song_name = fixed_filename[1].strip
    artist_name = fixed_filename[0].strip
    
    track = self.create
    track.name = song_name
    track.artist_name = artist_name
    track
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
