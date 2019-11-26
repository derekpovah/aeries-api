module Aeries
  module Api
    class Client

      module Contacts

        def contacts(school_code = '', student_id: nil)
          response = self.class.get("/schools/#{school_code}/contacts/#{student_id}")
          response.parsed_response
        end

      end

    end
  end
end
