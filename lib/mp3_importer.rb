require 'pry'

class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    filepaths = Dir["#{path}/*.mp3"]
    #binding.pry
    normalize(filepaths)
  end

  def normalize(filepaths_array)
    filepaths_array.map do |filepath|
      /mp3s\/(.*.mp3)$/.match(filepath)[1]
    end
  end



  def import
    files.each do |filename|

      song_info = filename.split (" - ")
      artist = song_info[0]
      title = song_info[1]

      new_song = Song.new(title)
      new_artist = Artist.find_or_create_by_name(artist)
      new_song.artist = new_artist
      new_artist.add_song(new_song)

      matching_artist = Artist.artist_exists?(artist)

      new_artist.save if !matching_artist
    end



  end

end