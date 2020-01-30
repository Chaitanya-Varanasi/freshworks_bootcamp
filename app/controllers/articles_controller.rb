class ArticlesController < ApplicationController

  def new
    @article=Article.new
  end

  def create

    @article=Article.new(params[:article].permit(:title,:description))
    #@article.save
    
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end

  end

  def edit
    @article = Article.find(params[:id])

  end

  def update
    @article = Article.find_by(params[:id])
    if @article.update(params[:article].permit(:title,:description))
      redirect_to article_path(@article)
    else
      render :edit
    end

  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find_by(id:params[:id])
  end

  def destroy
    @article = Article.find_by(id:params[:id])
    @article.destroy
    redirect_to articles_path

  end



end
