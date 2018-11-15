module Admin
  class ProjectsController < ApplicationController
    before_action :authenticate!

    def index
      @projects = Project.all
    end

    def new
      @project = Project.new
    end

    def create
      @project = Project.new(project_params)

      if @project.save
        redirect_to [:admin, @project]
      else
        render :new
      end
    end

    def show
      @project = Project.find(params[:id])
    end

    private

    def project_params
      params.require(:project).permit(:title, :description, :deadline_on, :bid)
    end
  end
end
