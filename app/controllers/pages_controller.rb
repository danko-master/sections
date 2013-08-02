class PagesController < ActionController::Base  
  # путь к вьюхам
  prepend_view_path 'app/views/sections'

  def index
    resource_model = Sections.resource_model
    @pages = resource_model.all
  end

  def new
    @page = Sections.resource_model.new
  end

  def create
    @page = Sections.resource_model.new params[Sections.resource_params_name]
    @page.save
    redirect_to sections_pages_path
  end

  def edit
    @page = Sections.resource_model.find_by_id params[:id]
  end

  def update
    @page = Sections.resource_model.find_by_id params[:id]
    @page.update_attributes params[Sections.resource_params_name]
    redirect_to sections_pages_path
  end
end