#coment
class MoviesController < ApplicationController
  def index
    if(params[:search])
      @movies = Movie.search(params[:search])
    else 
      @movies = Movie.all
    end
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
      # flash[:error] = 'Campo "Name" obrigatório!'
      render :new
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