class ImagesController < ApplicationController
	def new
		@project = Project.find(params[:project_id])
		@image = @project.images.build
	end

	def create
		@project = Project.find(params[:project_id])
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
end
