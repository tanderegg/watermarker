class ImagesController < ApplicationController
	
	before_filter :get_project

	def show
		@image = @project.images.find(params[:id])
		@regions = @image.regions
	end

	def new
		@image = @project.images.build
	end

	def create
		@image = @project.images.build(image_params)

		if @image.save
			redirect_to [@project, @image]
		else
			render :new
		end
	end

	private

	    def image_params
	      params.require(:image).permit(:name, :original, :project)
	    end

	    def get_project
	    	@project = Project.find(params[:project_id])
	    end
end
