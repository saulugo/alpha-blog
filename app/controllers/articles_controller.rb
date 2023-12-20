class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def show

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

  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first #pending to remove this, this is for testing purposes

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
    if @article.update(article_params)
      flash[:notice] = "Article updated!"
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
