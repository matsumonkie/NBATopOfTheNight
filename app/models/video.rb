require 'youtubeAPI'

class Video
  attr_reader :name

  def initialize(name) 
    @name = name
  end

  def self.last(maxResults)
    rawVideos = YoutubeAPI.new.last(maxResults)
    videos = []
    rawVideos.each do |youtubeVideo|
      #videos.push(Video.new("coucou"))
      videos.push(Video.new(youtubeVideo))
    end
    
    return videos
  end

end
