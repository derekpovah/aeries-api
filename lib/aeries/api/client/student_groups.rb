module Aeries
  module Api
    class Client

      module StudentGroups

        def student_groups(school_code = '')
          response = self.class.get("/schools/#{school_code}/studentgroups")
          response.parsed_response
        end

      end

    end
  end
end
