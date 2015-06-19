class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = current_user.projects
  end

  def show
    @project = Project.find(params[:id])
    @images = @project.images
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user

    if @project.save
      redirect_to @project
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(project_params)
      redirect_to @project
    else
      render :edit
    end
  end

  def delete
    @project = Project.find(params[:id]).destroy
    redirect_to projects_path
  end

  private

    def project_params
      params.require(:project).permit(:name, :description, :user, :client, :logo)
    end
end
