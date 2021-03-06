class SongsController < ApplicationController
  def index
    @songs = Song.order(:title).paginate(page: params[:page])
  end

  def show
    @song = Song.find(params[:id])

    render json: @song.to_json( 
                   include: { interpreters: { only: :name }, 
                              genres: { only: :name } })
  end

  def new
    @song = Song.new
  end
  
  def create
    @song = Song.new(params[:song])
    if @song.save
      flash[:success] = I18n.t('songs.create.success')
      redirect_to songs_path
    else
      render 'new'
    end
  end

  def edit
    @song = Song.find(params[:id])
  end
  
  def update
    @song = Song.find(params[:id])
    if @song.update_attributes(params[:song])
      flash[:success] = I18n.t('songs.update.success')
      redirect_to songs_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @song = Song.find(params[:id]).destroy
    redirect_to songs_path
  end
end
