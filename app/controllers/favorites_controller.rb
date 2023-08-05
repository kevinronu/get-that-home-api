class FavoritesController < ApplicationController
  before_action :require_login!, except: %i[show]
  before_action :set_favorite, only: %i[show destroy]

  # GET /favorites
  def index
    favorites = Favorite.where(user_id: current_user.id).order(created_at: :desc)
    favorites_data = []
    favorites.each do |favorite|
      favorites_data.push(my_favorite_data(favorite))
    end
    render json: favorites_data, status: :ok
  end

  # GET /favorites/:id
  def show
    render json: favorite_data(@favorite), status: :ok
  end

  # POST /favorites
  def create
    if current_user.role == "seeker"
      @favorite = Favorite.new(user_id: current_user.id, property_id: params[:property_id])

      if @favorite.save
        render json: my_favorite_data(@favorite), status: :created
      else
        render json: @favorite.errors, status: :unprocessable_entity
      end
    else
      render_unauthorized("Invalid role")
    end
  end

  # DELETE /favorites/1
  def destroy
    binding.pry
    if @favorite.user_id == current_user.id
      @favorite.destroy
    else
      render_unauthorized("Invalid credentials")
    end
  end

  private

  def favorite_data(favorite)
    favorite.as_json(except: %i[user_id])
  end

  def my_favorite_data(favorite)
    property = favorite.property
    favorite.as_json(except: %i[user_id]).merge(
      property.as_json(except: %i[id user_id]),
      images: property.images.map do |image|
        url_for(image)
      end
    )
  end

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

  def favorite_params
    params.permit(:property_id)
  end
end
