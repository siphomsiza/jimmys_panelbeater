class HomeController < ApplicationController
  layout false
  def index
    @galleries_albums = Galleries::Album.where(public_display: true).limit(9)
  end
end
