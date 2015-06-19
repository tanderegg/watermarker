class RegionsController < ApplicationController

  before_filter :get_project_and_image

  def new
    @region = @image.regions.build
    @region.payoff = Payoff.new
  end

  def create
    @region = @image.regions.create(region_params)
    @region.payoff = @project.payoffs.create(payoff_params)

    if @region.save
      redirect_to [@project, @image]
    else
      render :new
    end
  end

  def edit
    @region = @image.regions.find(params[:id])
  end

  def update
    @region = @image.regions.find(params[:id])

    if @region.update_attributes(region_params) and @region.payoff.update_attributes(payoff_params)
      redirect_to [@project, @image]
    else
      render :edit
    end
  end

  def delete
    @region = @image.regions.find(params[:id]).destroy
    redirect_to [@project, @image]
  end

  private

    def region_params
      params.require(:region).permit(:name, :top, :left, :width, :height, :watermark_strength, :watermark_resolution, :payoff_attributes)
    end

    def payoff_params
      params[:region].require(:payoff_attributes).permit(:name, :url)
    end

    def get_project_and_image
      @project = Project.find(params[:project_id])
      @image = @project.images.find(params[:image_id])
    end
end
