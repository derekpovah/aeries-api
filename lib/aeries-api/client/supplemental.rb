module AeriesApi
  class Client
    module Supplemental
      def school_supplemental(school_code:, student_id:)
        response = self.class.get("/schools/#{school_code}/schoolsupplemental/#{student_id}")
        mash_and_underscore_keys(response.parsed_response)
      end

      def district_supplemental(school_code:, student_id:)
        response = self.class.get("/schools/#{school_code}/districtsupplemental/#{student_id}")
        mash_and_underscore_keys(response.parsed_response)
      end

      def update_school_supplemental(school_code:, student_number:, columns:)
        options = {
          body: { Columns: camelize_keys(columns) }.to_json,
        }

        response = self.class.post("/updateschoolsupplemental/#{school_code}/#{student_number}", options)
        mash_and_underscore_keys(response.parsed_response)
      end
    end
  end
end
