class BarbersController < ApplicationController
  def index
    barbers = Barber.all
    render json: barbers.to_json

  end

  def show
    barber = Barber.find(params[:id])
    render json: barber
  end

end
