require 'google/api_client'

class YoutubeAPI 

  APPLICATION_NAME = "NBATopOfTheNight"
  APPLICATION_VERSION = "1.0"
  DEVELOPER_KEY = "AIzaSyDCvktmE1kPAw1-TTnTw-JkrQlZcSowMhQ"
  YOUTUBE_API_SERVICE_NAME = "youtube"
  YOUTUBE_API_VERSION = "v3"
  NBA_CHANNEL_ID = 'UCWJ2lWNubArHWmf3FIHbfcQ'
  
  GOOGLE_CONF = {
    key: DEVELOPER_KEY, 
    authorization: nil, 
    application_name: APPLICATION_NAME,
    application_version: APPLICATION_VERSION
  }
  
  def initialize
    @client = Google::APIClient.new(GOOGLE_CONF)
    @youtube = @client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)
    @opts = { part: 'id, snippet', q: 'Top', type: 'videos', order: 'date', channelId: NBA_CHANNEL_ID }
  end

  def last(maxResults = 5)
    @opts.merge! maxResults: maxResults
    response = @client.execute!(
      :api_method => @youtube.search.list,
      :parameters => @opts
    )
   
    @videos = []
    response.data.items.each do |v|    
      #@videos.push("#{v.snippet.title} #{v.snippet.publishedAt} (#{v.id.videoId})")
      @videos.push("#{v.id.videoId}")
    end
    
    return @videos
  end    
  
end

#p YoutubeAPI.new.last
#p YoutubeAPI.new.last(1)
