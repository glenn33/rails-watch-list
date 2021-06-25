class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])

  end

  def new
    @list = List.new
  end

  def update
    @list = List.find(params[:id])
    @movie = Movie.find(params[])
    @list.movies = @movie
    @list.update(list_params)
    redirect_to list_path(@list)
  end

  def create
    @list = List.new(list_params)
    if @list.save 
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :movie_ids)
  end
end
