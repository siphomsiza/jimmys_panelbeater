class NotesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)
    @note.user = current_user
    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_position
    return redirect_to :back unless params[:note_id] && params[:pos_x] && params[:pos_y] && params[:z_index]
    @note = Note.find(params[:note_id])
    @note.pos_x = params[:pos_x] + "px"
    @note.pos_y = params[:pos_y] + "px"
    @note.z_index = params[:z_index]
    @note.save
    @notes = Note.all
    # return redirect_to authenticated_root_path()
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_note
    @note = Note.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def note_params
    params.require(:note).permit(:id,:user_id,:title,:private, :content, :color,:pos_x,:pos_y,:z_index)
  end

  def section_name
    'Notes'
  end

  def section
    'Notes'
  end

  def sub_section
    action_name
  end

  def sub_section_display_name
    false
  end

end
