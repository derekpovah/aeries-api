RSpec.describe Aeries::Api::Client do
  let(:client) { Aeries::Api::Client.new(aeries_cert: 'aeries_cert', base_uri: 'demo.aeries.net/api/v3') }

  it 'returns an array of Hashie::Mash objects' do
    response = client.students(school_code: 990)
    expect(response.first).to be_an_instance_of(Hashie::Mash)
  end

  it 'underscores hash keys' do
    response = client.student(school_code: 990, student_id: 99000001)
    expect(response.first.has_key?('permanent_id')).to be_truthy
  end
end
