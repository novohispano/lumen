class Admin::HighlightsController < ApplicationController
  def index
    @highlights = Highlight.all
  end

  def new
    @highlight = Highlight.new
  end

  def create
    @highlight = Highlight.new(highlight_params)

    if @highlight.save
      redirect_to admin_highlights_path, success: 'El contenido se ha guardado exitosamente.'
    else
      flash.now[:danger] = "El contenido no pudo ser guardado. #{format_errors(@highlight)} Por favor, intenta de nuevo."
      render :new
    end
  end

  def edit
    @highlight = Highlight.find(params[:id])
  end

  def update
    @highlight = Highlight.find(params[:id])

    if @highlight.update_attributes(highlight_params)
      redirect_to admin_highlights_path, success: "El contenido #{@highlight.title} se actualizó exitosamente."
    else
      flash.now[:warning] = "El contenido #{@highlight.title} no pudo actualizarse. #{format_errors(@highlight)} Por favor, intenta de nuevo."
      render :edit
    end
  end

  def destroy
    highlight = Highlight.find(params[:id])
    highlight.destroy

    redirect_to admin_highlights_path, success: "El contenido #{highlight.title} se eliminó del sistema."
  end

  private

  def highlight_params
    params.require(:highlight).permit(:title, :description, :content_type)
  end
end
