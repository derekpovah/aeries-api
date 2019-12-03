RSpec.describe Aeries::Api::Client::StudentPictures do
  let(:client) { Aeries::Api::Client.new(aeries_cert: 'aeries_cert', base_uri: 'demo.aeries.net/api/v3') }

  it 'fetches student pictures' do
    response = client.student_pictures(school_code: 990)
    expect(response.first.permanent_id).to eq(99000001)
  end

  it 'fetches a single student picture' do
    response = client.student_picture(school_code: 990, student_id: 99000001)
    expect(response.first.permanent_id).to eq(99000001)
  end
end
