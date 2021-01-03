class PropertiesController < ApplicationController
  
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
      render edit_property(@property)
    end
  end
  
  def delete_property_confirmation
    @property = Property.find_by(id: params[:property])
  end

  def destroy
    get_property
    @property.delete
    redirect_to properties_path
  end
  
  private
  
  def get_property
    @property = Property.find_by(id: params[:id])
  end
    
  def property_params
    params.require(:property).permit(:title)
  end
end
