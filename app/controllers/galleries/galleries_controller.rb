class Galleries::GalleriesController < ApplicationController
  before_action :find_album
  before_action :set_galleries_gallery, only: [:show, :edit, :update, :destroy]

  # GET /galleries/galleries
  # GET /galleries/galleries.json
  def index
    @galleries_galleries = @galleries_album.galleries.all
    respond_to do |format|
      format.html { render :index }
      # format.json { render json: []} # ON PURPOSE
      format.json { render json: @galleries_galleries.map{|x| x.to_jq_upload }}
    end
  end

  # GET /galleries/galleries/1
  # GET /galleries/galleries/1.json
  def show
  end

  # GET /galleries/galleries/new
  def new
    @galleries_gallery = @galleries_album.galleries.new
  end

  # GET /galleries/galleries/1/edit
  def edit
  end

  # POST /galleries/galleries
  # POST /galleries/galleries.json
  def create
    @galleries_gallery = @galleries_album.galleries.new(galleries_gallery_params)
    @galleries_gallery.user = current_user
    respond_to do |format|
      if @galleries_gallery.save
        format.html { redirect_to galleries_album_gallery_path(@galleries_gallery), notice: 'Gallery was successfully created.' }
        # format.json { render :show, status: :created, location: @galleries_gallery }
        format.json { render json: {files: [@galleries_gallery.to_jq_upload] }, status: :created}

      else
        format.html { render :new }
        format.json { render json: @galleries_gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /galleries/galleries/1
  # PATCH/PUT /galleries/galleries/1.json
  def update
    respond_to do |format|
      if @galleries_gallery.update(galleries_gallery_params)
        format.html { redirect_to @galleries_gallery, notice: 'Gallery was successfully updated.' }
        format.json { render :show, status: :ok, location: @galleries_gallery }
      else
        format.html { render :edit }
        format.json { render json: @galleries_gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/galleries/1
  # DELETE /galleries/galleries/1.json
  def destroy
    @galleries_gallery.destroy
    respond_to do |format|
      format.html { redirect_to galleries_album_galleries_path(@galleries_album), notice: 'Gallery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_album
    @galleries_album = Galleries::Album.find(params[:album_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_galleries_gallery
    @galleries_gallery = @galleries_album.galleries.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def galleries_gallery_params
    # params.fetch(:galleries_gallery, {})
    params[:galleries_gallery][:file] = params[:galleries_gallery][:file].first if params[:galleries_gallery][:file].is_a? Array
    params.require(:galleries_gallery).permit(:file, :album_id,:position,:seq)
  end

  def section_name
    'Galleries'
  end

  def section
    'Galleries'
  end

  def sub_section
    action_name
  end

  def sub_section_display_name
    false
  end

end
