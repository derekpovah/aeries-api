RSpec.describe Aeries::Api::Client::Students do
  let(:client) { Aeries::Api::Client.new(aeries_cert: 'aeries_cert', base_uri: 'https://demo.aeries.net/api/v3') }

  it 'fetches students' do
    response = client.students(school_code: 990)
    expect(response.first.permanent_id).to eq(99000001)
  end

  it 'fetches a single student' do
    response = client.student(school_code: 990, student_id: 99000001)
    expect(response.first.permanent_id).to eq(99000001)
  end

  it 'fetches students by grade' do
    response = client.students(school_code: 990, grade: 5)
    expect(response.first.permanent_id).to eq(99000003)
  end
end
