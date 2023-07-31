class ContactsController < ApplicationController
  before_action :require_login!, except: %i[index show]
  before_action :set_contact, only: %i[show]

  # GET /contacts
  def index
    contacts = Contact.where(user_id: current_user.id).order(created_at: :desc)
    contacts_data = []
    contacts.each do |contact|
      contacts_data.push(my_contact_data(contact))
    end
    render json: contacts_data, status: :ok
  end

  # GET /contacts/:id
  def show
    render json: contact_data(@contact), status: :ok
  end

  # POST /contacts
  def create
    if current_user.role == "seeker"
      @contact = Contact.new(user_id: current_user.id, property_id: params[:property_id])
      if @contact.save
        render json: my_contact_data(@contact), status: :created
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    else
      render_unauthorized("Invalid role")
    end
  end

  # DELETE /contacts/1
  # def destroy
  #   if @contact.user_id == current_user.id
  #     @contact.destroy
  #   else
  #     render_unauthorized("Invalid credentials")
  #   end
  # end

  private

  def contact_data(contact)
    contact.as_json(except: %i[user_id])
  end

  def my_contact_data(contact)
    property = contact.property
    landlord = property.user
    contact.as_json(except: %i[user_id]).merge(
      landlord_email: landlord.email,
      landlord_phone: landlord.phone
    )
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.permit(:property_id)
  end
end
