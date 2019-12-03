RSpec.describe Aeries::Api::Client::StudentGroups do
  let(:client) { Aeries::Api::Client.new(aeries_cert: 'aeries_cert', base_uri: 'demo.aeries.net/api/v3') }

  it 'fetches student groups' do
    response = client.student_groups(school_code: 990)
    expect(response.first.school_code).to eq(990)
  end
end
