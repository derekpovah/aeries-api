module AeriesApi
  class ErrorHandler
    def handle_error(response)
      return if response.success?
      raise http_errors[response.code].new(response)
    end

    private

    def http_errors
      {
        400 => AeriesApi::BadRequest,
        401 => AeriesApi::AuthenticationError,
        404 => AeriesApi::NotFound,
        500 => AeriesApi::ServerError,
        502 => AeriesApi::ServerError,
        503 => AeriesApi::ServerError,
        504 => AeriesApi::ServerError,
      }
    end
  end
end
