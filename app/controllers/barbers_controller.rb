class BarbersController < ApplicationController
  def index
    barbers = Barber.all
    render json: barbers.to_json

  end

  def update
    barber = Barber.find(params[:id])
    # byebug
    if params[:avatar]
      
      barber.avatar.attach(params[:avatar])
      
      barber.photo = url_for(barber.avatar)
      barber.save
      barber.update(barber_params)
    else  
      barber.update(barber_params)
    end
    
    
    render json: barber
  end
  
  def show
    barber = Barber.find(params[:id])
    render json: barber
  end

  private

  def barber_params
    # byebug
    params.permit(:file, :id, :password, :password_confirmation, :user_name, :first_name, :last_name, :email, :zip_code)
  end 
end
