class VideosController < ApplicationController

  def index
    @video = Video.last(1)
    render layout: false
  end

  def list
    @videos = Video.last(5)
  end

end
