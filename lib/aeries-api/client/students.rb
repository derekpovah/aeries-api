module AeriesApi
  class Client
    module Students
      def student(school_code:, student_id:)
        response = self.class.get("/schools/#{school_code}/students/#{student_id}")
        mash_and_underscore_keys(response.parsed_response)
      end

      def students(school_code:, grade: nil)
        if grade
          endpoint = "/schools/#{school_code}/students/grade/#{grade}"
        else
          endpoint = "/schools/#{school_code}/students"
        end
        response = self.class.get(endpoint)
        mash_and_underscore_keys(response.parsed_response)
      end
    end
  end
end
