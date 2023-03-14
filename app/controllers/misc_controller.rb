class MiscController < ApplicationController
  # Visitors don't need to be logged in to see these pages
  skip_before_action :authentication

  def about
  end

  def privacy
  end
end
