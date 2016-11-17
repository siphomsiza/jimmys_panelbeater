class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  layout false
  def index
    @galleries_albums = Galleries::Album.where(public_display: true).limit(9)
  end

  def show
    @galleries_album = Galleries::Album.find(params[:album_id])
    @images = @galleries_album.galleries
    render layout: "application-devise"
  end

  private

  def section_name
    'Gallery'
  end

  def section
    'Gallery'
  end

  def sub_section
    action_name
  end

  def sub_section_display_name
    false
  end

end
