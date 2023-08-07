class PropertiesController < ApplicationController
  before_action :require_login!, except: %i[index show]
  before_action :set_property, only: %i[show update destroy]

  # GET /properties
  def index
    properties = Property.order(contacts_count: :desc)
    properties_data = []
    properties.each do |property|
      properties_data.push(property_data(property))
    end
    render json: properties_data, status: :ok
  end

  # GET /properties/:id
  def show
    render json: property_data(@property), status: :ok
  end

  # POST /properties
  def create
    if current_user.role == "landlord"
      property = Property.new(property_params.except(:images))
      property.user = current_user

      images = property_params[:images]
      images&.each do |image|
        property.images.attach(image)
      end

      if property.save
        render json: property_data(property), status: :created
      else
        render json: property.errors, status: :unprocessable_entity
      end
    else
      render_unauthorized("Invalid role")
    end
  end

  # PATCH/PUT /properties/1
  def update
    if @property.user_id == current_user.id
      if @property.update(property_params.except(:images))
        images = property_params[:images]
        images&.each do |image|
          @property.images.attach(image)
        end
        render json: property_data(@property)
      else
        render json: @property.errors, status: :unprocessable_entity
      end
    else
      render_unauthorized("Invalid credentials")
    end
  end

  # DELETE /properties/1
  def destroy
    if @property.user_id == current_user.id
      @property.destroy
    else
      render_unauthorized("Invalid credentials")
    end
  end

  private

  def property_data(property)
    property.as_json(except: %i[user_id]).merge(
      images: property.images.map do |image|
        url_for(image)
      end
    )
  end

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.permit(:operation_type, :address, :city, :country, :price, :monthly_rent, :maintenance,
                  :property_type, :bedrooms, :bathrooms, :area, :pets_allowed, :about, :closed,
                  :user_id, images: [])
  end
end
