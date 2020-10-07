RSpec.describe AeriesApi::Client::StudentPrograms do
  let(:client) { AeriesApi::Client.new(aeries_cert: 'aeries_cert', base_uri: 'https://demo.aeries.net/api/v5') }

  it 'fetches student programs' do
    response = client.student_programs(school_code: 994, student_id: 99400001)
    expect(response.count).to eq(9)
  end
end
