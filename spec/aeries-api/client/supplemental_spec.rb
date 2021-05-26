RSpec.describe AeriesApi::Client::Supplemental do
  let(:client) { AeriesApi::Client.new(aeries_cert: 'aeries_cert', base_uri: 'https://demo.aeries.net/api/v5') }

  it 'fetches student school supplemental' do
    response = client.school_supplemental(school_code: 994, student_id: 99400001)
    expect(response.first.student_id).to eq(99400001)
  end

  it 'fetches student district supplemental' do
    response = client.student(school_code: 994, student_id: 99400001)
    expect(response.first.student_id).to eq(99400001)
  end

  it 'updates school supplemental' do
    columns = [
      {
        column_code: 'PI',
        new_value: 'Test',
      },
      {
        column_code: 'XX',
        new_value: 'Test',
      },
    ]
    response = client.update_school_supplemental(school_code: 994, student_number: 1, columns: columns)
    expect(response.columns.first.value).to eq('Test')
    expect(response.columns.last.value).to eq('Test')
  end
end
