class TreesController < ApplicationController

  helper_method :last_survey
  helper_method :current_survey

  def index
    get_property
    @trees = @property.trees
  end

  def show
    get_tree
  end
  
  def new
    @tree = Tree.new
    @tree.species = Species.new
    get_property
    @errors = @tree.errors
  end

  def create
    @survey = Survey.find_by(id: params[:survey_id])
    get_property
    @tree = @property.trees.build(tree_params)
    @tree.user = current_user
    select_or_create_species
    @tree.species = @species
    authorize(@tree)
    if @survey
      if @tree.save
        redirect_to @survey
      else
        @errors = @tree.errors
        render 'trees/new'
      end
    else
      if @tree.save
        redirect_to @tree
      else
        @errors = @tree.errors
        render 'trees/new'
      end
    end
  end

  def edit
  end

  def update
    authorize(@tree)
  end

  def destroy
    authorize(@tree)
  end

  def select_survey
    get_tree
    @surveys = @tree.property.surveys
  end

  def species_selection
    get_property
    @trees = Tree.includes(:species).where(property_id: @property.id)
    @species = @trees.map(&:species).uniq
  end

  def single_species_index
    get_property
    @trees = @property.trees.of_species(params[:species_id])
    render 'trees/index'
  end

  def last_survey(tree)
    tree.surveys.find_by(date: tree.surveys.maximum("date")).inspections.find_by(tree_id: tree.id)
  end
  
  def current_survey(tree)
    tree.surveys.find_by(id: params[:survey]).inspections.find_by(tree_id: tree.id)
  end
  
  private
  
  def tree_params
    params.require(:tree).permit(:name)
  end

  def get_tree
    @tree = Tree.find_by(id: params[:id])
  end

  def get_property
    @property = Property.find_by(id: params[:property_id])
  end
    
  def select_or_create_species
    if params[:tree][:species] == "" && params[:tree][:species_attributes][:name] != ""         # If user wants to enter new species
      @species = Species.create(name: params[:tree][:species_attributes][:name])
    else                                                                                           # If user simply selects from dropdown
      @species = Species.find_by(id: params[:tree][:species])
    end
  end


end
