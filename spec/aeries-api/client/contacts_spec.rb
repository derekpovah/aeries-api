RSpec.describe AeriesApi::Client::Contacts do
  let(:client) { AeriesApi::Client.new(aeries_cert: 'aeries_cert', base_uri: 'https://demo.aeries.net/api/v5') }

  it 'fetches contacts' do
    response = client.contacts(school_code: 994, student_id: 99400001)
    expect(response.first.student_id).to eq(99400001)
  end
end
