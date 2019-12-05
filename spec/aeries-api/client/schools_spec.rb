RSpec.describe AeriesApi::Client::Schools do
  let(:client) { AeriesApi::Client.new(aeries_cert: 'aeries_cert', base_uri: 'https://demo.aeries.net/api/v3') }

  it 'fetches schools' do
    response = client.schools
    expect(response.first.school_code).to eq(0)
  end

  it 'fetches a single school' do
    response = client.school(school_code: 990)
    expect(response.first.school_code).to eq(990)
  end
end
