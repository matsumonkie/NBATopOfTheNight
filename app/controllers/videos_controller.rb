class VideosController < ApplicationController

  # show last videos
  def index
    @videos = Video.last(5)
  end

  # show the last video
  def show
    @video = Video.last(1)[0]
    render layout: false
  end

end
