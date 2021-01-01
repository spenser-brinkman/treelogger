class SurveysController < ApplicationController

  def index
    @surveys = current_user.surveys
  end

  def show
    get_survey
  end

  def new
    @property = Property.find_by(id: params[:property_id])
    @survey = Survey.new
  end

  def create
    @survey = Property.find_by(id: params[:property_id]).surveys.build(survey_params)
    if @survey.save
      redirect_to @survey
    else
      render new_property_survey_path(@survey.property)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def choose_property_to_survey
    @properties = current_user.properties.all
  end
  
  private
  
  def survey_params
    params.require(:survey).permit(:date)
  end

  def get_survey
    @survey = current_user.surveys.find_by(id: params[:id])
  end

end
