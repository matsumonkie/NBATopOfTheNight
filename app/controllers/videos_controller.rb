class VideosController < ApplicationController

  def index
    @videos = Video.last(5)
  end

  def show
    @video = Video.last(1)
    render layout: false
  end

end
