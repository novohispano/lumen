class Admin::ProjectsController < Admin::AdminController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to admin_projects_path, success: 'El projecto se ha guardado exitosamente.'
    else
      flash.now[:danger] = 'El projecto no pudo ser guardado. Por favor, intenta de nuevo.'
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(project_params)
      redirect_to admin_projects_path, success: "El proyecto #{@project.name} se actualizó exitosamente."
    else
      flash.now[:warning] = "El proyecto #{@project.name} no pudo actualizarse. Por favor, intenta de nuevo."
      render :edit
    end
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy

    redirect_to admin_projects_path, success: "El proyecto #{project.email} se eliminó del sistema."
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :address, :beneficiaries, :home)
  end
end
