class BarbersController < ApplicationController
  def index
    barbers = Barber.all
    render json: barbers.to_json
  end

  def create 
    # byebug
    barber = Barber.create(barber_params)
    if params[:avatar]
      barber.avatar.attach(params[:avatar])
      barber.photo = url_for(barber.avatar)
      barber.save
    end
 
    payload = {user_id: barber.id}
    token = encode(payload)
    render json: {user: barber, token: token}

  end

  def update
    barber = Barber.find(params[:id])
    # byebug
    barber.update(barber_params)
    if params[:avatar]
      barber.avatar.purge_later
      barber.avatar.attach(params[:avatar])
      barber.save
      barber.photo = url_for(barber.avatar)
      barber.save
    end
    # byebug
    
    render json: barber
  end
  
  def show
    barber = Barber.find(params[:id])
    # byebug
    render json: barber
    # render :json => barber.to_json(:include => [:photos, :barber_reviews => {:include => :barber_review_comments}])
  end

  def destroy
    Barber.find(params[:id]).destroy
  end

  private

  def barber_params
    # byebug
    params.permit(:updated_at, :avatar, :password, :password_confirmation, :username, :first_name, :last_name, :email, :zip_code)
  end 
end
