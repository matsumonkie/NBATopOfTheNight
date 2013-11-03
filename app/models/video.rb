class Video
  require 'youtubeAPI'

  def self.last(maxResults)
    return YoutubeAPI.new.last(maxResults)
  end

end
