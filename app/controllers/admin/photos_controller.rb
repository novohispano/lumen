class Admin::PhotosController < Admin::AdminController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def edit
    @photo = Photo.find_by(id: params[:id])
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to admin_photos_path, success: 'La foto se está procesando y estará lista en unos momentos.'
    else
      flash.now[:danger] = 'La foto no pudo ser guardada. Por favor, intenta de nuevo.'
      render :new
    end
  end

  def update
    @photo = Photo.find_by(id: params[:id])

    if @photo.update_attributes(photo_params)
      redirect_to admin_photos_path, success: 'La foto se está procesando y estará lista en unos momentos.'
    else
      flash.now[:danger] = 'La foto no pudo ser actualizada. Por favor, intenta de nuevo.'
      render :edit
    end
  end

  def destroy
    if Photo.destroy(params[:id])
      redirect_to admin_photos_path, success: 'La foto se ha eliminado del sitio.'
    else
      redirect_to admin_photos_path, danger: 'La foto no se pudo eliminar del sitio. Por favor, intenta de nuevo.'
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:description, :file, :project_id, :slider)
  end
end
