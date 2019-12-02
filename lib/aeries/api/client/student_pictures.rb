module Aeries
  module Api
    class Client

      module StudentPictures

        def student_picture(school_code:, student_id:)
          response = self.class.get("/schools/#{school_code}/studentpictures/#{student_id}")
          mash_and_underscore_keys(response.parsed_response)
        end

        def student_pictures(school_code:)
          response = self.class.get("/schools/#{school_code}/studentpictures/")
          mash_and_underscore_keys(response.parsed_response)
        end

      end

    end
  end
end
