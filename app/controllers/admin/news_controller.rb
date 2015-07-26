class Admin::NewsController < Admin::AdminController
  def index
    @news = News.all
  end

  def show
    @news = News.find(params[:id])
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)

    if @news.save
      redirect_to admin_news_index_path, success: 'La noticia se ha guardado exitosamente.'
    else
      flash.now[:danger] = 'La noticia no pudo ser guardada. Por favor, intenta de nuevo.'
      render :new
    end
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])

    if @news.update_attributes(news_params)
      redirect_to admin_news_index_path, success: "La noticia #{@news.title} se actualizó exitosamente."
    else
      flash.now[:danger] = "La noticia #{@news.title} no pudo actualizarse. Por favor, intenta de nuevo."
      render :edit
    end
  end

  def destroy
    news = News.find(params[:id])
    news.destroy

    redirect_to admin_news_index_path, success: "La noticia #{news.title} se eliminó del sistema."
  end

  private

  def news_params
    params.require(:news).permit(:title, :body, :author)
  end
end
