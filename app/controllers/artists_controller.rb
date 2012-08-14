class ArtistsController < ApplicationController
  def index
    @artists = Artist.order(:name).paginate(page: params[:page])
  end
  
  def new
    @artist = Artist.new
  end
  
  def create
    @artist = Artist.new(params[:artist])
    if @artist.save
      flash[:success] = I18n.t('artists.create.success')
      redirect_to artists_path
    else
      render 'new'
    end
  end
  
  def edit
    @artist = Artist.find(params[:id])
  end
  
  def update
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(params[:artist])
      flash[:success] = I18n.t('artists.update.success')
      redirect_to artists_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @artist = Artist.find(params[:id]).destroy
    
    redirect_to(artists_path)
  end
end
