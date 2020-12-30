class InspectionsController < ApplicationController

  def new
    @tree = Tree.find_by(id: params[:tree_id])
  end

end