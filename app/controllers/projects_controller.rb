class ProjectsController < ApplicationController
  before_action :authenticate!
  before_action :find_project, only: [:show, :comment, :claim, :unclaim]

  def index
    scope = Project
    scope = case params[:t]
      when "claimed" then scope.where(claimed_by: current_user)
      when "in_progress" then scope.where(status: :in_progress)
      when "complete" then scope.where(status: :complete)
      when "pending" then scope.where(status: :pending)
      else scope
    end

    @projects = scope.order(deadline_on: :ASC)
  end

  def show
  end

  def comment
    @project.comments.create(comment_params) do |comment|
      comment.author = current_user
    end

    redirect_to @project
  end

  def claim
    if @project.claimed_by == nil && !@project.complete?
      @project.update(claimed_by: current_user, status: :in_progress)
      redirect_to @project, notice: "You've been assigned to this project."
    end
  end

  def unclaim
    if @project.claimed_by == current_user && !@project.complete?
      @project.update(claimed_by: nil, status: :pending)
      redirect_to @project, notice: "You've been removed to this project."
    end
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:message, :file)
  end
end
