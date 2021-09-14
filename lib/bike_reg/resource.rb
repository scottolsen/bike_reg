# frozen_string_literal: true

module BikeReg
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end

    private

    def get_request(url, params: {}, headers: {})
      handle_response client.connection.get(url, params, headers)
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/MethodLength
    def handle_response(response)
      case response.status
      when 400
        raise Error, "Your request was malformed. #{response.body['error']}"
      when 401
        raise Error, "You did not supply valid authentication credentials. #{response.body['error']}"
      when 403
        raise Error, "You are not allowed to perform that action. #{response.body['error']}"
      when 404
        raise Error, "No results were found for your request. #{response.body['error']}"
      when 429
        raise Error, "Your request exceeded the API rate limit. #{response.body['error']}"
      when 500
        raise Error, "We were unable to perform the request due to server-side problems. #{response.body['error']}"
      when 503
        raise Error,
              "The server is currently unable to handle the request due to a temporary overloading or maintenance of the
 server. #{response.body['error']}"
      end

      response
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/MethodLength
  end
end
