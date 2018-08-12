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
    return song
  end
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name
    return song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    return song
    # self.new_by_name(name)
  end
  
  def self.find_by_name(name)
    self.all.find{|item| item.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(filename)
    artistName = filename.split("-")[0].split(" ").join(" ")
    songName = filename.split("-")[1].split(".")[0].split(" ").join(" ")
    song = self.new
    song.name = songName
    song.artist_name = artistName
    song
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

end
