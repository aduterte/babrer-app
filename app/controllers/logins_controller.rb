class LoginsController < ApplicationController

    def login 
        if params[:is_barber] == "true"
            barber = Barber.find_by(email: params[:email])
            if barber && barber.authenticate(params[:password])
                payload = {barber_id: barber.id}
                token = encode(payload)
                render :json => {user: user, token: token}
            else 
                render :json {error: "User not found"}
            end
            
        else 
            client = Client.find_by(email: params[:email])
            if client && client.authenticate(params[:password])
                payload = {client_id: client.id}
                token = encode(payload)
                render :json => {user: user, token: token}
            else 
                render :json {error: "User not found"}
            end
        end
    end

    def token_authenticate
        token = request.headers["Authenticate"]
        is_barber = request.headers["User"]
        if is_barber == "true"
            Barber.find(decode(token)["barber_id"])
        else  
            Client.find(decode(token)["client_id"])
        end

    end
end