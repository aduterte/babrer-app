class ClientsController < ApplicationController
  def index
    clients = Client.all
    render json: clients
  end

  def show
    client = Client.find(params[:id])
    render json: client
  end

  def update
    client = Client.find(params[:id])

    if params[:avatar]
      client.avatar.attach(params[:avatar])
      client.photo = url_for(client.avatar)
      client.save
      
    end
    client.update(client_params)
    render json: client
  end

  private 
  def client_params
    # byebug
    params.permit(:password, :password_confirmation, :user_name, :first_name, :last_name, :email, :zip_code)
  end 
end
