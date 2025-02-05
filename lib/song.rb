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
      song.save
      song      
    end

    def self.new_by_name(song_name)
      song = self.new
      song.name = song_name
      song
    end

    def self.create_by_name(song_name)
      song = self.new
      song.name = song_name
      song.save
      song
    end

    def self.find_by_name(song_name)
      @@all.map {|song| 
        if song.name == song_name
         return song
        end
      }
      nil
    end

    def self.find_or_create_by_name(song_name)
      if self.find_by_name(song_name)
        self.find_by_name(song_name)
      else
        self.create_by_name(song_name)
      end
    end

    def self.alphabetical
      @@all.sort_by {|song| song.name}
    end

    def self.new_from_filename(filename)
      song_array = filename.split(/\-+|\./)
      artist_name = song_array[0][0...-1]
      song_name = song_array[1][1..-1]
      
      song = self.new
      song.name = song_name
      song.artist_name = artist_name
      song
    end

    def self.create_from_filename(filename)
      # "Taylor Swift - Blank Space.mp3"
      song_array = filename.split(/\-+|\./)
      artist_name = song_array[0][0...-1]
      song_name = song_array[1][1..-1]
      
      song = self.new
      song.name = song_name
      song.artist_name = artist_name
      song.save
      song
    end

    def self.destroy_all
      self.all.clear
    end

end
