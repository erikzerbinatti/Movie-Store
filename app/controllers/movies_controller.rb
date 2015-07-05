#coment
class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new 
    @movie = Movie.new
  end

  def create
    filtered = params.require(:movie).permit(:name, :price, :year, :description)
    @movie = Movie.new(filtered)

    if(@movie.save)
      flash[:success] = 'Salvo com sucesso!'
      redirect_to @movie
    else
      flash[:error] = 'Campo "Name" obrigatório!'
      redirect_to new_movie_path
    end 
  end

  def destroy
    filtered = params[:id]
    if(Movie.destroy(filtered))
      flash[:success] = 'Deletado com sucesso!'
    end
    
    redirect_to '/movies'
  end

  def edit 
    id = params[:id]
    @movie = Movie.find(id)
  end

  def update
    filtered = params.require(:movie).permit(:name, :price, :year, :description, :id)
    @movie = Movie.find(params[:id])
    @movie.update_attributes(filtered)
    if(@movie.save)
      flash[:success] = 'Atualizado com sucesso!'
      redirect_to @movie
    else
      flash[:error] = 'Campo "Name" obrigatório!'
      redirect_to edit_movie_path(@movie)
    end
  end
end