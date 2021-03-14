class PhotosController < ApplicationController

    def create 
        photo = Photo.create(photo_params)
        photo.image.attach(params[:image])
        photo.photo = url_for(photo.image)
        photo.save
        render json: photo
    end


    private 

    def photo_params 
        params.permit(:barber_id, :comment, :order)
    end
end
