class ContactsController < ApplicationController
  before_action :move_to_index
  before_action :set_contact, only: [:edit, :show, :update]

  def index
    @contacts = Contact.includes(:school).order("created_at DESC")
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create(contact_params)
    if @contact.save
      redirect_to contacts_path
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
  end

  def edit
  end

  def update
    @contact.update(contact_params)
    if @contact.save
      redirect_to contacts_path
    else
      render 'edit'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:subject, :contents).merge(school_id: current_school.id)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def move_to_index
    unless school_signed_in? || user_signed_in?
      redirect_to root_path
    end
  end

end
