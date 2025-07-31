module AeriesApi
  class Client
    module Staff
      def staff(staff_id:)
        response = self.class.get("/staff/#{staff_id}")
        @error_handler.handle_error(response)
        mash_and_underscore_keys(response.parsed_response)
      end

      def all_staff
        response = self.class.get('/staff')
        @error_handler.handle_error(response)
        mash_and_underscore_keys(response.parsed_response)
      end
    end
  end
end
