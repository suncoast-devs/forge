class HomeController < ApplicationController
  def index
    if signed_in?
      @projects = Project.all
    end
  end
end
