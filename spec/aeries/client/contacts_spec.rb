RSpec.describe Aeries::Api::Client::Contacts do
  let(:client) { Aeries::Api::Client.new(aeries_cert: 'aeries_cert', base_uri: 'https://demo.aeries.net/api/v3') }

  it 'fetches contacts' do
    response = client.contacts(school_code: 990, student_id: 99000001)
    expect(response.first.permanent_id).to eq(99000001)
  end
end
