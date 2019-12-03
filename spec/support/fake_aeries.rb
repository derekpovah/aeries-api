require 'sinatra/base'

class FakeAeries < Sinatra::Base
  # Contacts Endpoint
  get '/api/v3/schools/:school_code/contacts/:student_id' do
    json_response(200, 'contacts.json')
  end

  # School Endpoints
  get '/api/v3/schools' do
    json_response(200, 'schools.json')
  end

  get '/api/v3/schools/:school_code' do
    json_response(200, 'school.json')
  end

  # Student Endpoints
  get '/api/v3/schools/:school_code/students/:student_id' do
    json_response(200, 'student.json')
  end

  get '/api/v3/schools/:school_code/students' do
    json_response(200, 'students.json')
  end

  get '/api/v3/schools/:school_code/students/grade/:grade' do
    json_response(200, 'students_by_grade.json')
  end

  # Student Group Endpoint
  get '/api/v3/schools/:school_code/studentgroups' do
    json_response(200, 'student_groups.json')
  end

  # Student Picture Endpoints
  get '/api/v3/schools/:school_code/studentpictures/:student_id' do
    json_response(200, 'student_picture.json')
  end

  get '/api/v3/schools/:school_code/studentpictures' do
    json_response(200, 'student_pictures.json')
  end

  private

  def json_response(http_code, file_name)
    content_type :json
    status http_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end

end
