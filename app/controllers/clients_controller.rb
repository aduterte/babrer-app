class ClientsController < ApplicationController
  def index
    clients = Client.all
    render json: clients.to_json
  end

  def show
    client = Client.find(params[:id])
    render json: client
  end
end
