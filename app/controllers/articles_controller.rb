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

  def edit
    @article = Article.find(params[:id])
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

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article updated!"
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

end
