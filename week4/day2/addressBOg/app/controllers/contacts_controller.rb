class ContactsController < ApplicationController

  def index

    @contacts_list = Contact.order(:name)

    render "index"
  end


  def new 
    render "new"


  end


  def search
    keyWord = params[:keyword]

    @found_list = Contact.where("name =~ ?", '\A[#{keyWord}]')



    render plain: @found_list.inspect
  end

  def show

    @favorite_list = Contact.where("favorite=?", true)



    render "favorite"


  end

  def favorite 
    id = params[:id].to_i
    item = Contact.find(id)

    item.favorite = true

    item.save



    redirect_to "/"

  end

  def create 
    name = params[:name]
    address = params[:address]
    number = params[:number]
    email = params[:email]

    # render plain: name.class



    if name !=""  && address != "" && number.length ==10 && email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/ && number.to_i.class == Fixnum
      Contact.create(name: name, address: address, number: number, email: email)
    end

    # # render plain: params.inspect

    redirect_to("/")

  end

  def detail
    id = params[:id].to_i
    @item = Contact.find(id)

    render "detail"


  end
end
