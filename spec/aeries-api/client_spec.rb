RSpec.describe AeriesApi::Client do
  let(:client) { AeriesApi::Client.new(aeries_cert: 'aeries_cert', base_uri: 'https://demo.aeries.net/api/v5') }

  it 'underscores hash keys' do
    response = client.student(school_code: 990, student_id: 99000001)
    expect(response.first.has_key?('student_id')).to be_truthy
  end

  context 'when the response is an array of hashes' do
    it 'returns an array of Hashie::Mash objects' do
      response = client.students(school_code: 990)
      expect(response.first).to be_an_instance_of(Hashie::Mash)
    end
  end

  context 'when the response is a single hash' do
    it 'returns a Hashie::Mash object' do
      response = client.update_school_supplemental(
        school_code: 990, student_number: 1,
        columns: [{ "column_code": 'XX', "new_value": 'Test' }],
      )
      expect(response).to be_an_instance_of(Hashie::Mash)
    end
  end
end
