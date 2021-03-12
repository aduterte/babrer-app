class BarbersController < ApplicationController
  def index
    barbers = Barber.all
    render json: barbers.to_json

  end

  def show
    barber = Barber.find(params[:id])
    render json: barber
  end

  private

  def barber_params
    # byebug
    params.permit(:user_name, :first_name, :last_name, :email, :avatar, :password, :zipcode)
    end 
end
