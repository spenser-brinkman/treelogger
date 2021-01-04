class InspectionsController < ApplicationController

  def new
    @survey = Survey.find_by(id: params[:survey])
    @inspection = Inspection.new
    @tree = Tree.find_by(id: params[:tree_id])
  end

  def create
    @survey = Survey.find_by(id: params[:survey_id])
    authorize(@survey)
    @inspection = @survey.inspections.build(inspection_params)
    @inspection.tree = Tree.find_by(id: params[:tree_id])
    @inspection.user = current_user
    authorize(@inspection)
    if @inspection.save
      redirect_to @survey
    end
  end

  private

  def inspection_params
    params.require(:inspection).permit(:height, :dbh, :foliage, :comments)
  end

end