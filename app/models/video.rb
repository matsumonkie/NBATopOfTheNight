require 'youtubeAPI'

class Video

  def self.last(maxResults)
    return YoutubeAPI.new.last(maxResults)
  end

end
