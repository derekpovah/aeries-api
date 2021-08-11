module AeriesApi
  class Client
    module StudentPrograms
      def student_programs(school_code:, student_id:)
        response = self.class.get("/schools/#{school_code}/students/#{student_id}/programs")
        @error_handler.handle_error(response)
        mash_and_underscore_keys(response.parsed_response)
      end
    end
  end
end
