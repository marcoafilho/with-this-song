class GenresController < ApplicationController
  def index
    @genres = Genre.order(:name).paginate(page: params[:page])
  end
  
  def new
    @genre = Genre.new
  end
  
  def create
    @genre = Genre.new(params[:genre])
    if @genre.save
      flash[:success] = I18n.t('genres.create.success')
      redirect_to genres_path
    else
      render 'new'
    end
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    @genre = Genre.find(params[:id])
    if @genre.update_attributes(params[:genre])
      flash[:success] = I18n.t('genres.update.success')
      redirect_to genres_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @genre = Genre.find(params[:id]).destroy
    
    redirect_to(genres_path)
  end
end
