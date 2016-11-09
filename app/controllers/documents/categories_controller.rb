class Documents::CategoriesController < ApplicationController
  before_action :find_parent_category
  before_action :set_documents_category, only: [:show, :edit, :update, :destroy]

  # GET /admin/documents/categories
  # GET /admin/documents/categories.json
  def index
    if @parent_category
      @documents_categories = @parent_category.children_categories
    else
      @documents_categories = Documents::Category.where(:parent_id => nil)
    end
  end

  # GET /admin/documents/categories/1
  # GET /admin/documents/categories/1.json
  def show
  end

  # GET /admin/documents/categories/new
  def new
    @documents_category = Documents::Category.new
  end

  # GET /admin/documents/categories/1/edit
  def edit
  end

  # POST /admin/documents/categories
  # POST /admin/documents/categories.json
  def create
    @documents_category = Documents::Category.new(documents_category_params)
    respond_to do |format|
      @documents_category.user = current_user
      if @documents_category.save
        flash[:success] = "#{@documents_category.parent_category ? 'Sub ':''} Category was successfully created."
        format.html { redirect_to documents_category_path(@documents_category)}
        format.json { render action: 'show', status: :created, location: @documents_category }
      else
        flash[:danger] = @documents_category.errors.full_messages
        format.html { render action: 'new'}
        format.json { render json: @documents_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/documents/categories/1
  # PATCH/PUT /admin/documents/categories/1.json
  def update
    respond_to do |format|
      @documents_category.user = current_user
      if @documents_category.update(documents_category_params)
        flash[:success] = "#{@documents_category.parent_category ? 'Sub ':''} Category was successfully created."
        format.html { redirect_to documents_category_path(@documents_category)}
        format.json { head :no_content }
      else
        flash[:danger] = @documents_category.errors.full_messages
        format.html { render action: 'edit'}
        format.json { render json: @documents_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/documents/categories/1
  # DELETE /admin/documents/categories/1.json
  def destroy
    @documents_category.destroy
    respond_to do |format|
      flash[:success] = "Category was successfully deleted."
      format.html { redirect_to documents_categories_path(@parent_category) }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  def find_parent_category
    @parent_category = Documents::Category.find(params[:category_id]) if params[:category_id]
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_documents_category
    @documents_category = Documents::Category.includes(:children_categories, :documents, :parent_category).find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def documents_category_params
    params.require(:documents_category).permit(:name, :parent_category_id,:parent_id,:colour)
  end

  def section_name
    'Categories'
  end

  def section
    'Categories'
  end

  def sub_section
    action_name
  end

  def sub_section_display_name
    false
  end

end
