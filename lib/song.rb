require_relative './artist.rb'

class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file_name)
        artist, title = file_name.split(" - ")
        new_song = self.new(title)
        new_song.artist_name = artist
        new_song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end

end