class ProjectsController < ApplicationController
  before_action :authenticate!

  def index
    @projects = Project.where.not(status: :complete).order(deadline_on: :ASC)
  end

  def show
    @project = Project.find(params[:id])
  end

  def comment
    @project = Project.find(params[:id])
    @project.comments.create(comment_params) do |comment|
      comment.author = current_user
    end

    redirect_to @project
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end
end
