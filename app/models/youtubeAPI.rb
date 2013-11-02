require 'rubygems'
require 'google/api_client'
require 'trollop'

APPLICATION_NAME = "NBATopOfTheNight"
APPLICATION_VERSION = "1.0"
DEVELOPER_KEY = "AIzaSyDCvktmE1kPAw1-TTnTw-JkrQlZcSowMhQ"
YOUTUBE_API_SERVICE_NAME = "youtube"
YOUTUBE_API_VERSION = "v3"
NBA_CHANNEL_ID = 'UCWJ2lWNubArHWmf3FIHbfcQ'

google_conf = {
  key: DEVELOPER_KEY, 
  authorization: nil, 
  application_name: APPLICATION_NAME,
  application_version: APPLICATION_VERSION
}

client = Google::APIClient.new(google_conf)
youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)
opts = { part: 'id, snippet', q: 'Top', maxResults: 5, type: 'videos', order: 'date', channelId: NBA_CHANNEL_ID }
search_response = client.execute!(
  :api_method => youtube.search.list,
  :parameters => opts
)
#<iframe src="http://www.youtube.com/embed/#{id}" width=640 height=480 frameborder=0></iframe>
videos = []
search_response.data.items.each do |v|
  videos.push("#{v.snippet.title} #{v.snippet.publishedAt} (#{v.id.videoId})")
end

puts videos
