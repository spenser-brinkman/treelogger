class PropertiesController < ApplicationController
  
  def show
    get_property
  end
    
  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def create
    @property = current_user.properties.build(property_params)
    if @property.save
      redirect_to @property
    else
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
    params.require(:property).permit(:address)
  end
end
