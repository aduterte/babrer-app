class ApplicationController < ActionController::API

    def secret_key
        "barBque"
    end

    def encode(payload)
        JWT.encode(payload, secrete_key, 'HS256')
    end

    def decode(token)
        JWT.decode(token, "barBque", true, {algorithm: 'HS256'})[0]
    end
end
