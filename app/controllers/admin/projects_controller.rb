module Admin
  class ProjectsController < ApplicationController
    before_action :authorize_admin!
    before_action :find_project, only: [:edit, :update]

    def index
      @projects = Project.all
    end

    def new
      @project = Project.new
    end

    def create
      @project = Project.new(project_params) do |project|
        project.requested_by = current_user
      end

      if @project.save
        redirect_to @project, notice: "Project Created"
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @project.update(project_params)
        redirect_to @project, notice: "Project Updated"
      else
        render :new
      end
    end

    private

    def find_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :description, :deadline_on, :bid, :is_paid, :status)
    end
  end
end
