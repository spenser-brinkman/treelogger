class SurveysController < ApplicationController
  def index
    @property = Property.find_by(id: params[:property_id])
    @surveys = @property.surveys
  end

  def show
    get_survey
    @property = @survey.property
  end

  def new
    @property = Property.find_by(id: params[:property_id])
    @survey = @property.surveys.build
  end

  def create
    @property = Property.find_by(id: params[:property_id])
    authorize(@property)
    @survey = @property.surveys.build(survey_params)
    @survey.user = current_user
    authorize(@survey)
    if @survey.save
      redirect_to @survey
    else
      @errors = @survey.errors
      render 'surveys/new'
    end
  end

  def edit
    @survey = Survey.find_by(id: params[:id])
  end

  def update
    get_survey
    if @survey.update(survey_params)
      redirect_to @survey
    else
      @errors = @survey.errors
      render 'surveys/edit'
    end
  end

  def delete_survey_confirmation
    @survey = Survey.find_by(id: params[:survey])
  end

  def destroy
    get_survey
    @property = @survey.property
    @survey.inspections.each { |i| i.destroy }
    @survey.destroy
    redirect_to property_path(@property)
  end

  # Controller Action to initiate process of starting survey prior to choosing property
  def new_survey
    @properties = current_user.properties.all
  end

  private

  def survey_params
    params.require(:survey).permit(:date)
  end

  def get_survey
    @survey = current_user.surveys.find_by(id: params[:id])
    authorize(@survey)
  end
end
