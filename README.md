aeries-api
==========

This gem provides an interface to the [Aeries SIS API](https://support.aeries.com/support/solutions/articles/14000077926-aeries-api-full-documentation).

I will implement endpoints as I need them, but will also consider pull requests that add support for additional endpoints. At the time of writing, this gem is designed to be used with version 3 of the Aeries API.

Installation
------------

Add this line to your application's Gemfile:

```ruby
gem 'aeries-api'
```

Usage
-----

#### Setup

Initialize the client:

```ruby
aeries = Aeries::Api::Client.new(
  aeries_cert: '477abe9e7d27439681d62f4e0de1f5e1',
  base_uri: ' https://demo.aeries.net/aeries/api/v3'
)
```

The client can also be configured via the environment:

```ruby
ENV['AERIES_CERT'] = '477abe9e7d27439681d62f4e0de1f5e1'
ENV['AERIES_BASE_URI'] = ' https://demo.aeries.net/aeries/api/v3'

aeries = Aeries::Api::Client.new
```

#### Retrieving Data

Most endpoints will require a school code to be passed as the first argument. Keyword arguments are then used to pass additional data to the API. Example:

```ruby
aeries.students(school_code: 99, grade_level: 4)
```

Available Methods:

```ruby
# /api/v3/schools
schools # returns all schools

# /api/v3/schools/#{school_code}
school(school_code: school_code) # returns a single school

# /api/v3/schools/#{school_code}/StudentGroups
student_groups(school_code: school_code) # returns all student groups at a school

# /api/v3/schools/#{school_code}/students
students(school_code: school_code) # returns all students at a school

# /api/v3/schools/#{school_code}/students/grade/#{grade_level}
students(school_code: school_code, grade_level: grade_level) # returns students in a specific grade level

# /api/v3/schools/#{school_code}/students/#{student_id}
student(school_code: school_code, student_id: student_id) # returns a single student

# /api/schools/#{school_code}/contacts/#{student_id}
contacts(school_code: school_code, student_id: student_id) # returns contacts for a student

# /api/schools/#{school_code}/StudentPictures
student_picture(school_code: school_code) # returns all student pictures at a school

# /api/schools/#{school_code}/StudentPictures/#{student_id}
student_pictures(school_code: school_code, student_id: student_id) # returns a single student's picture
```

License
-------

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
