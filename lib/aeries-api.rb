require 'httparty'
require 'aeries-api/version'
require 'aeries-api/client'

module AeriesApi
  class ResponseError < StandardError
    attr_accessor :response

    def initialize(response)
      message = response.parsed_response['Message']
      super(message.length <= 50 ? message[0..50] : message)
      @response = response
    end
  end

  class AuthenticationError < ResponseError; end

  class BadRequest < ResponseError; end

  class Forbidden < ResponseError; end

  class NotFound < ResponseError; end

  class ServerError < ResponseError; end
end
