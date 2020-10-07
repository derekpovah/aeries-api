RSpec.describe AeriesApi::Client::StudentGroups do
  let(:client) { AeriesApi::Client.new(aeries_cert: 'aeries_cert', base_uri: 'https://demo.aeries.net/api/v5') }

  it 'fetches student groups' do
    response = client.student_groups(school_code: 994)
    expect(response.first.school_code).to eq(994)
  end
end
