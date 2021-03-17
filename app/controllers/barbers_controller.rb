class BarbersController < ApplicationController
  def index
    barbers = Barber.all
    render json: barbers.to_json

  end

  def create 
    barber = Barber.create(barber_params)
    if params[:avatar]
      barber.avatar.attach(params[:avatar])
      barber.photo = url_for(barber.avatar)
      barber.save
      
    end
    # byebug
    render json: barber
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
    render :json => barber.to_json(:include => [:barber_reviews, :photos])
  end

  def destroy
    Barber.find(params[:id]).destroy
  end

  private

  def barber_params
    # byebug
    params.permit(:avatar, :id, :password, :password_confirmation, :username, :first_name, :last_name, :email, :zip_code)
  end 
end
