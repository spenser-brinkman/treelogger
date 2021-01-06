class PropertiesController < ApplicationController
  
  before_action :delete_associations, only: [:destroy]

  def show
    get_property
  end
    
  def index
    @properties = current_user.properties
  end

  def new
    @property = Property.new
    @errors = @property.errors
  end
  
  def create
    @property = current_user.properties.build(property_params)
    authorize(@property)
    if @property.save
      redirect_to @property
    else
      @errors = @property.errors
      render new_property_path(@property)
    end
  end

  def edit
    get_property
  end
  
  def update
    get_property
    if @property.update(property_params)
      redirect_to @property
    else
      flash.alert = @property.errors.full_messages
      redirect_to edit_property_path(@property)
    end
  end
  
  def delete_property_confirmation
    @property = Property.find_by(id: params[:property])
    authorize(@property)
  end

  def destroy
    get_property
    @property.delete
    redirect_to properties_path
  end

  def tallest_tree
    @property = Property.find_by(id: params[:property])
    @inspection = recent_survey(@property).inspections.tallest.first
    @tree = @property.inspections.tallest.first.tree
  end

  private
  
  def get_property
    @property = Property.find_by(id: params[:id])
    authorize(@property)
  end
    
  def property_params
    params.require(:property).permit(:title)
  end

  def delete_associations
    get_property
    @property.trees.each { |t| t.inspections.destroy_all }
    @property.surveys.destroy_all
    @property.trees.destroy_all
  end
end
