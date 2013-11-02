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
  
  @client = Google::APIClient.new(GOOGLE_CONF)
  @youtube = @client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)
  @opts = { part: 'id, snippet', q: 'Top', maxResults: 5, type: 'videos', order: 'date', channelId: NBA_CHANNEL_ID }
  
  def getLastVideos
    search_response = @client.execute!(
      :api_method => @youtube.search.list,
      :parameters => @opts
    )
    @videos = []
    search_response.data.items.each do |v|
      videos.push("#{v.snippet.title} #{v.snippet.publishedAt} (#{v.id.videoId})")
    end
    
    return videos
  end  

  getLastVideos
  
end
