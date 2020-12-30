class TreesController < ApplicationController

  def index
  end

  def show
    get_tree
  end

  def new
    @tree = Tree.new
    @survey = Survey.find_by(id: params[:survey_id])
    @tree.surveys << @survey
    @species = Species.new
    @tree.species = @species
  end

  def create
    @survey = Survey.find_by(id: params[:survey_id])
    byebug
    @tree = Survey.find_by(id: params[:survey_id]).trees.build(tree_params)
    if @tree.save
      redirect_to @tree
    else
      render new_tree_path(@tree.survey)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def choose_property_to_tree
    @properties = current_user.properties.all
  end
  
  private
  
  def tree_params
    params.require(:tree).permit(:name, :height, :dbh, :foliage, :comments)
  end

  def get_tree
    @tree = current_user.trees.find_by(id: params[:id])
  end

end
