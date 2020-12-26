class GenresController < ApplicationController
  def show 
    current_genre
  end  

  def edit
    current_genre
  end  

  def update
    current_genre.update(genre_params(:name))
    redirect_to genre_path(@genre)
  end 

  def new 
    @genre = Genre.new
  end  

  def create
    @genre = Genre.create(genre_params(:name))
    redirect_to genre_path(@genre)
  end  

  private
  def current_genre
    @genre ||= Genre.find(params[:id])
  end  

  def genre_params(*args)
    params.require(:genre).permit(*args)
  end
end
