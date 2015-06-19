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

	def edit
		@image = @project.images.find(params[:id])
	end

	def update
		@image = @project.iamges.find(params[:id])
	
		if @image.update_attribtes(image_params)
			redirect_to [@project, @image]
		else
			render :edit
		end
	end

	def delete
		@image = @project.images.find(params[:id])
		@image.destroy
		redirect_to @project
	end

	def download
		@image = @project.images.find(params[:id])
		send_file(@image.original.path, filename: File.basename(@image.original.path), type: "image/jpg")
	end

	private

	    def image_params
	      params.require(:image).permit(:name, :original, :project)
	    end

	    def get_project
	    	@project = Project.find(params[:project_id])
	    end
end
