require 'bundler/setup'
require 'aeries-api'
require 'webmock/rspec'

require 'support/fake_aeries'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  # Stub requests to the Aeries API
  config.before(:each) do
    stub_request(:any, /demo.aeries.net/).to_rack(FakeAeries)
  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
