# app/controllers/genres_controller.rb
class GenresController < ApplicationController
  def search
    @genres = Genre.all
    render json: @genres.pluck(:name)
  end
end
