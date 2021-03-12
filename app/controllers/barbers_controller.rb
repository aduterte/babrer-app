class BarbersController < ApplicationController
  def index
    barbers = Barber.all
    render json: barbers.to_json

  end

  def update
    barber = Barber.find(params[:id])
    # byebug
    if params[:avatar]
      byebug
      barber.avatar.attach(params[:avatar])
      photo = url_for(barber.avatar)
      barber.update
    end
    
    barber.update(barber_params)
    render json: barber
  end
  
  def show
    barber = Barber.find(params[:id])
    render json: barber
  end

  private

  def barber_params
    # byebug
    params.permit(:file, :id, :password, :password_confirmation, :user_name, :first_name, :last_name, :email, :avatar, :zip_code)
  end 
end
