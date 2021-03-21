class ApplicationController < ActionController::API
    include ActionController::Serialization

    def secret_key
        "barBque"
    end

    def encode(payload)
        JWT.encode(payload, secret_key, 'HS256')
    end

    def decode(token)
        JWT.decode(token, "barBque", true, {algorithm: 'HS256'})[0]
    end
end
