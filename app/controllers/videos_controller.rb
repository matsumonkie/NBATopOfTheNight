class VideosController < ApplicationController

  def index
    @video = Video.last
    render layout: false
  end

  def list
    @videos = Video.all
  end

end
