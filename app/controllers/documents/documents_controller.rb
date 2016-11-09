class Documents::DocumentsController < ApplicationController
  before_action :find_parent_category
  before_action :set_documents_document, only: [:show, :edit, :update, :destroy]

  # GET /admin/documents/documents
  # GET /admin/documents/documents.json
  def index
    @documents_documents = @parent_category.documents.all
    respond_to do |format|
      format.html { render :index }
      # format.json { render json: []} # ON PURPOSE
      format.json { render json: @documents_documents.map{|x| x.to_jq_upload }}
    end
  end

  # GET /admin/documents/documents/1
  # GET /admin/documents/documents/1.json
  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: {:files => [@documents_document.data] } }
    end
  end

  # GET /admin/documents/documents/new
  def new
    @documents_document = @parent_category.documents.new
  end

  # GET /admin/documents/documents/1/edit
  def edit
    respond_to do |format|
      format.html { render :edit }
      format.json { render json: {:files => [@documents_document.to_jq_upload] } }
    end

    # respond_to do |format|
    #   format.json { render json: {files: [@documents_document.to_jq_upload] }, status: :edit}
    # end
  end

  # POST /admin/documents/documents
  # POST /admin/documents/documents.json
  def create
    @documents_document = @parent_category.documents.new(documents_document_params)
    respond_to do |format|
      @documents_document.user = current_user
      if @documents_document.save
        flash[:success] = 'Document was successfully created.'
        format.html { redirect_to  documents_category_document_path(@parent_category,@documents_document)}
        format.json { render json: {files: [@documents_document.to_jq_upload] }, status: :created}
      else
        flash[:danger] = @documents_document.errors.full_messages
        format.html { redirect_to action: 'new', parent_category: @documents_document.category }
        #format.html { render action: 'new' }
        format.json { render json: @documents_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/documents/documents/1
  # PATCH/PUT /admin/documents/documents/1.json
  def update
    respond_to do |format|
      if @documents_document.update(documents_document_params)
        flash[:success] = 'Document was successfully updated.'
        format.html { redirect_to documents_category_document_path(@parent_category,@documents_document) }
        format.json { head :no_content }
      else
        flash[:danger] = @documents_document.errors.full_messages
        format.html { redirect_to action: 'edit', parent_category: @documents_document.category }
        format.json { render json: @documents_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/documents/documents/1
  # DELETE /admin/documents/documents/1.json
  def destroy
    @documents_document.destroy
    respond_to do |format|
      flash[:success] = 'Document was successfully deleted.'
      if params[:sub_category]
        format.html { redirect_to documents_category_path(@parent_category) }
      else
        format.html { redirect_to documents_category_documents_path(@parent_category) }
      end
      format.json { head :no_content }
    end
  end

  private

  def find_parent_category
    @parent_category = Documents::Category.find(params[:category_id]) if params.include?:category_id
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_documents_document
    @documents_document = @parent_category.documents.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def documents_document_params
    params[:documents_document][:file] = params[:documents_document][:file].first if params[:documents_document][:file].is_a? Array
    params.require(:documents_document).permit(:file, :category_id)
  end

  def section_name
    'Documents'
  end

  def section
    'Documents'
  end

  def sub_section
    action_name
  end

  def sub_section_display_name
    false
  end

end
