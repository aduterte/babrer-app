class ClientsController < ApplicationController
  def index
    clients = Client.all
    render json: clients
  end

  def create 
    
    client = Client.create(client_params)
    if params[:avatar]
      client.avatar.attach(params[:avatar])
      client.photo = url_for(client.avatar)
      client.save
      
    end
 
    payload = {user_id: client.id}
    token = encode(payload)
    render json: {user: client, token: token}
  end



  def update
    client = Client.find(params[:id])
    # byebug
    client.update(client_params)
    if params[:avatar]
      client.avatar.purge_later
      client.avatar.attach(params[:avatar])
      client.save
      client.photo = url_for(client.avatar)
      client.save
    end
    
    
    render json: client
  end

  def show
    client = Client.find(params[:id])
    render json: client
    # render :json => client.to_json(:include => {:client_reviews => {:include => :client_review_comments}})
  end

  def destroy
    Client.find(params[:id]).destroy
  end

  private 
  def client_params
    # byebug
    params.permit(:avatar, :password, :password_confirmation, :username, :first_name, :last_name, :email, :zip_code)
  end 
end
