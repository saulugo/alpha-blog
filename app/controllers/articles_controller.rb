class ArticlesController < ApplicationController
  def show
    #debugger
    @article = Article.find(params[:id])
  end

  def index
    #debugger
    @articles = Article.all
  end

  def new
    @article = Article.new
    #debugger
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))

    if @article.save
      flash[:notice] = "Article created!"
      redirect_to article_path(@article)
    else
      #render 'new'
      render :new, status: :unprocessable_entity
      #debugger
    end
  end
end
