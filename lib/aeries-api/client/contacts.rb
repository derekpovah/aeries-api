module AeriesApi
  class Client

    module Contacts

      def contacts(school_code:, student_id:)
        response = self.class.get("/schools/#{school_code}/contacts/#{student_id}")
        mash_and_underscore_keys(response.parsed_response)
      end

    end

  end
end
