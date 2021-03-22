class LoginsController < ApplicationController

    def login
        params[:login][:isBarber] == true ? user_type = Barber : user_type = Client
        user = user_type.find_by(email: params[:login][:email])
        if user && user.authenticate(params[:login][:password])
            payload = {user_id: user.id}
            token = encode(payload)
            # byebug
            user = BarberSerializer.new(user) if user_type == Barber
           
            
            render json: {user: user, token: token} 
        else  
            render json: {error: "User not found"}
        end
        # if params[:login][:isBarber] == true
        #     # byebug
        #     barber = Barber.find_by(email: params[:login][:email])
        #     byebug
        #     if barber && barber.authenticate(params[:login][:password])
        #         payload = {barber_id: barber.id}
        #         token = encode(payload)
        #         render json: {user: barber, token: token}
        #     else 
        #         # byebug
        #         render json: {error: "User not found"}
        #     end
            
        # else 
        #     byebug
        #     client = Client.find_by(email: params[:login][:email])
        #     if client && client.authenticate(params[:login][:password])
        #         payload = {client_id: client.id}
        #         token = encode(payload)
        #         render json: {user: client, token: token}
        #     else 
        #         render json: {error: "User not found"}
        #     end
        # end
    end

    def token_authenticate
        token = request.headers["Authenticate"]
        is_barber = request.headers["User"]
       
        is_barber == "true" ? user_type = Barber : user_type = Client
        user = user_type.find(decode(token)["user_id"])
 
        render json: user
    end
end