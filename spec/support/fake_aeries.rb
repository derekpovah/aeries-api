require 'sinatra/base'

class FakeAeries < Sinatra::Base
  # Contacts Endpoint
  get '/api/v5/schools/:school_code/contacts/:student_id' do
    json_response(200, 'contacts.json')
  end

  # School Endpoints
  get '/api/v5/schools' do
    json_response(200, 'schools.json')
  end

  get '/api/v5/schools/:school_code' do
    json_response(200, 'school.json')
  end

  # Student Endpoints
  get '/api/v5/schools/:school_code/students/:student_id' do
    json_response(200, 'student.json')
  end

  get '/api/v5/schools/:school_code/students' do
    json_response(200, 'students.json')
  end

  get '/api/v5/schools/:school_code/students/grade/:grade' do
    json_response(200, 'students_by_grade.json')
  end

  # Student Group Endpoint
  get '/api/v5/schools/:school_code/studentgroups' do
    json_response(200, 'student_groups.json')
  end

  # Student Picture Endpoints
  get '/api/v5/schools/:school_code/studentpictures/:student_id' do
    json_response(200, 'student_picture.json')
  end

  get '/api/v5/schools/:school_code/studentpictures' do
    json_response(200, 'student_pictures.json')
  end

  # Student Programs Endpoint
  get '/api/v5/schools/:school_code/students/:student_id/programs' do
    json_response(200, 'student_programs.json')
  end

  # Student School Supplemental Endpoint
  get '/api/v5/schools/:school_code/schoolsupplemental/:student_id' do
    json_response(200, 'school_supplemental.json')
  end

  # Student District Supplemental Endpoint
  get '/api/v5/schools/:school_code/districtsupplemental/:student_id' do
    json_response(200, 'district_supplemental.json')
  end

  # Update Student District Supplemental Endpoint
  post '/api/v5/updateschoolsupplemental/:school_code/:student_number' do
    json_response(200, 'update_school_supplemental.json')
  end

  private

  def json_response(http_code, file_name)
    content_type :json
    status http_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
