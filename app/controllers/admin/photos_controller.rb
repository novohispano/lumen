class Admin::PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to admin_photos_path, success: 'La foto se ha guardado exitosamente.'
    else
      flash.now[:danger] = 'La foto no pudo ser guardada. Por favor, intenta de nuevo.'
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:file)
  end
end
