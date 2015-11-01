class PhotosController < ApplicationController

	def index
		@photos = Photo.all.order("created_at DESC")
	end

	def create
		@photo = Photo.new(photo_params)

		if @photo.save
			redirect_to photos_path, notice: "Successfully created a photo"
		else
			render 'new'
		end

	end

	def new
		@photo = Photo.new
	end

	private

	def photo_params
		params.require(:photo).permit(:title, :image)
	end

end
