class Admin::PhotosController < Admin::AdminController
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
    params.require(:photo).permit(:file, :project_id, :slider)
  end
end
