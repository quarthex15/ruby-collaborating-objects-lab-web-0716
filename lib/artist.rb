class Artist

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(artist_name)
    @name = artist_name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(artist_name)
    matching_artist = artist_exists?(artist_name)

    matching_artist ? matching_artist : Artist.new(artist_name)
  end

  def self.artist_exists?(artist_name)
    @@all.detect do |artist_instance|
      artist_instance.name == artist_name
    end
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end

  def add_song(song)
    @songs << song
  end

end