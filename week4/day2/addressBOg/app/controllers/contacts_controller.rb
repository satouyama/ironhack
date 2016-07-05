class ContactsController < ApplicationController

  def index

    @contacts_list = Contact.all

    render "index"
  end


  def new 
    render "new"


  end


  def create 
    name = params[:name]
    address = params[:address]
    number = params[:number]
    email = params[:email]

    Contact.create({name: name, address: address, number: number, email: email})



    redirect_to "/"

  end
end
