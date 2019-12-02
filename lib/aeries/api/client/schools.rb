module Aeries
  module Api
    class Client

      module Schools

        def school(school_code = '')
          response = self.class.get("/schools/#{school_code}")
          mash_and_underscore_keys(response.parsed_response)
        end

        def schools
          response = self.class.get("/schools")
          mash_and_underscore_keys(response.parsed_response)
        end

      end

    end
  end
end
