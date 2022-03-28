class Movie < ApplicationRecord
  belongs_to :movie
  
  
  
  def index
    movies = Movie.all
    render json: movies.as_json
  end

  def create
    movie = Movie.create(
      title: params[:title],
      year: params[:year],
      plot: params[:plot]
    )
    render json: movie.as_json
  end

  def show
    movie = Movie.find_by(id: params[:id])
    render json: movie.as_json
  end

  def update
    movie = Movie.find_by(id: params[:id])

    movie.title = params[:title] || movie.title
    movie.year = params[:year] || movie.year
    movie.plot = params[:plot] || movie.plot

    movie.save
    render json: {message: "updated"}
  end

  def delete
    movie = Movie.find_by(id: params[:id])
    movie.destroy
    render json: {message: "destroyed"}
  end
end
