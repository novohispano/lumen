class NewsController < ApplicationController
  def index
    @news = News.recent
  end

  def show
    @news      = News.find(params[:id])
    @news_list = News.recent
  end
end
