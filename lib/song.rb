require 'pry'

class Song

  attr_accessor :name
  attr_reader :artist

  def initialize(song_name)
    @name = song_name
  end

  def artist=(artist)
    @artist = artist
  end

  def self.new_by_filename(file_name)
    song_info = file_name.split (" - ")
    artist = song_info[0]
    title = song_info[1]
    new_song = Song.new(title)
    new_artist = Artist.find_or_create_by_name(artist)
    new_song.artist = new_artist

    new_song
  end

end