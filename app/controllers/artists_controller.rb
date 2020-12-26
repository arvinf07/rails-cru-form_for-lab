class ArtistsController < ApplicationController

  def show 
    current_artist
  end  

  def edit
    current_artist
  end  

  def update
    current_artist.update(artist_params(:name, :bio))
    redirect_to artist_path(@artist)
  end 

  def new 
    @artist = Artist.new
  end  

  def create
    @artist = Artist.create(artist_params(:name, :bio))
    redirect_to artist_path(@artist)
  end  

  private
  def current_artist
    @artist ||= Artist.find(params[:id])
  end  

  def artist_params(*args)
    params.require(:artist).permit(*args)
  end

end
