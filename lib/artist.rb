require_relative './song.rb'

class Artist
    attr_accessor :name

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(artist_name)
        self.all.find {|artist| artist.name == artist_name} ? self.all.
        find {|artist| artist.name === artist_name} : self.new(artist_name)
    end

    def print_songs
        Song.all.each do |song|
           if song.artist == self
            puts song.name
           end
        end
    end

end

