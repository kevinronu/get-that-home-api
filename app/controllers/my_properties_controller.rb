class MyPropertiesController < ApplicationController
  # GET /my_properties
  def index
    my_properties = Property.where(user_id: current_user.id).order(created_at: :desc)
    my_properties_data = []
    my_properties.each do |property|
      my_properties_data.push(property_data(property))
    end
    render json: my_properties_data, status: :ok
  end

  private

  def property_data(property)
    property.as_json(except: %i[user_id])
  end
end
