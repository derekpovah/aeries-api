module Aeries
  module Api
    class Client

      module Schools

        def school(school_code = '')
          response = self.class.get("/schools/#{school_code}")
          response.parsed_response
        end

        def schools
          response = self.class.get("/schools")
          response.parsed_response
        end

      end

    end
  end
end
