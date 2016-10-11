class ContactsController < ApplicationController

	def index
	  @contacts = Contact.all
	end

	def new
	  @contact = Contact.new
	end

	def create
	  @contact = Contact.new(contact_params)
	  @contact.user_id = current_user.id

	  if @contact.save
	    redirect_to contacts_path, notice: "New contact #{@contact.full_name} created."
	  else
	    render 'new'
	  end

	end

	def edit
	  @contact = Contact.find(params[:id])
	end

	def update
	  @contact = Contact.find(params[:id])
	  if @contact.update(contact_params)
	    redirect_to contacts_path, notice: "New contact #{@contact.full_name} updated."
	  else
	    render 'edit'
	  end
	end

	def destroy
	  Contact.find(params[:id]).destroy
	  redirect_to contacts_path, notice: "Contact was destroyed."
	end

	private

	def contact_params
	  params.require(:contact).permit([:first_name, :mid_name, :last_name, :email, :alt_email, :phone, :mobile, :skype, :address_id, :access])
	end

end