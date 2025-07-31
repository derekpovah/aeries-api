RSpec.describe AeriesApi::Client::Staff do
  let(:client) { AeriesApi::Client.new(aeries_cert: 'aeries_cert', base_uri: 'https://demo.aeries.net/api/v5') }

  it 'fetches all staff records' do
    response = client.all_staff
    expect(response.first.id).to eq(884616)
  end

  it 'fetches a single staff record' do
    response = client.staff(staff_id: 884616)
    expect(response.id).to eq(884616)
  end
end
