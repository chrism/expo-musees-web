module UniteamAPI
  class User
    require 'rest_client'
    @uniteam_api = RestClient::Resource.new(
      ENV['UNITEAM_API_URL'],
      :user => ENV['UNITEAM_API_USERNAME'],
      :password => ENV['UNITEAM_API_PASSWORD']
    )

    def self.authenticate(email, password)
      response = @uniteam_api['logUser'].get(:params => {:email => email, :password => password})
      parsed_response = JSON.parse(response.body)
      if parsed_response["error"] == 0
        # successful retrieve the cookie info from Uniteam
        Rails.logger.info "cookies returned are #{response.cookies}"
        response.cookies

      else
        raise ExpoMusees::AuthenticationError, "There was a problem signing in"
      end
    end

    def self.add_user(firstname, lastname, email, password)
      response = @uniteam_api['addUser'].get(:params => {:firstname => firstname, :lastname => lastname, :email => email, :password => password})
      parsed_response = JSON.parse(response.body)
      if parsed_response["error"] == 0
        # successful retrieve the cookie info from Uniteam
        response.cookies
      else
        raise ExpoMusees::AuthenticationError, "There was a problem signing up"
      end
    end

    def self.log_out(session_hash)
      response = @uniteam_api['logoutUser'].get(:cookies => session_hash)
      parsed_response = JSON.parse(response.body)
      if parsed_response["error"] == 0
        # successful log out
        true
      else
        raise ExpoMusees::AuthenticationError, "There was a problem signing out"
      end
    end

    def self.get_user(session_hash)
      response = @uniteam_api['getUser'].get(:cookies => session_hash)
      user = JSON.parse(response.body)["user"]
      if (user)
        {
          firstname: user["firstname"],
          lastname: user["lastname"],
          uniteam_id: user["id"],
          email: user["email"],
          id_facebook: user["idFacebook"],
          id_city: user["idCity"],
          preference: user["preference"],
          accept_info: user["acceptInfo"],
          phone: user["phone"],
          office: user["office"],
          create_date: user["createDate"],
          id_type: user["idType"],
          last_update_date: user["lastUpdateDate"],
          last_login_date: user["lastLoginDate"],
          status: user["status"]
        }
      else
        nil
      end
    end
  end
end