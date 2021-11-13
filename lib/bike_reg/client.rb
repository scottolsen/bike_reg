# frozen_string_literal: true

module BikeReg
  class Client
    BASE_URL = 'https://www.BikeReg.com/api'

    def event
      EventResource.new(self)
    end

    def registrations
      RegistrationResource.new(self)
    end

    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        conn.request :json
        conn.response :json, content_type: 'application/json'
      end
    end
  end
end
