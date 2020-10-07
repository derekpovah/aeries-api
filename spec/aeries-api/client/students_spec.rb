RSpec.describe AeriesApi::Client::Students do
  let(:client) { AeriesApi::Client.new(aeries_cert: 'aeries_cert', base_uri: 'https://demo.aeries.net/api/v5') }

  it 'fetches students' do
    response = client.students(school_code: 994)
    expect(response.first.student_id).to eq(99400001)
  end

  it 'fetches a single student' do
    response = client.student(school_code: 994, student_id: 99400001)
    expect(response.first.student_id).to eq(99400001)
  end

  it 'fetches students by grade' do
    response = client.students(school_code: 994, grade: 12)
    expect(response.first.student_id).to eq(99400001)
  end
end
