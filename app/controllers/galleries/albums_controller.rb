class Galleries::AlbumsController < ApplicationController
  before_action :set_galleries_album, only: [:show, :edit, :update, :destroy]

  # GET /galleries/albums
  # GET /galleries/albums.json
  def index
    @galleries_albums = Galleries::Album.all
  end

  # GET /galleries/albums/1
  # GET /galleries/albums/1.json
  def show
    @images = @galleries_album.galleries
  end

  # GET /galleries/albums/new
  def new
    @galleries_album = Galleries::Album.new
  end

  # GET /galleries/albums/1/edit
  def edit
  end

  # POST /galleries/albums
  # POST /galleries/albums.json
  def create
    @galleries_album = Galleries::Album.new(galleries_album_params)
    @galleries_album.user = current_user
    respond_to do |format|
      if @galleries_album.save
        format.html { redirect_to @galleries_album, notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @galleries_album }
      else
        format.html { render :new }
        format.json { render json: @galleries_album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /galleries/albums/1
  # PATCH/PUT /galleries/albums/1.json
  def update
    respond_to do |format|
      if @galleries_album.update(galleries_album_params)
        format.html { redirect_to @galleries_album, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @galleries_album }
      else
        format.html { render :edit }
        format.json { render json: @galleries_album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/albums/1
  # DELETE /galleries/albums/1.json
  def destroy
    @galleries_album.destroy
    respond_to do |format|
      format.html { redirect_to galleries_albums_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_galleries_album
    @galleries_album = Galleries::Album.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def galleries_album_params
    params.require(:galleries_album).permit(:name, :user_id,:description,:public_display)
  end

  def section_name
    'Albums'
  end

  def section
    'Albums'
  end

  def sub_section
    action_name
  end

  def sub_section_display_name
    false
  end

end
