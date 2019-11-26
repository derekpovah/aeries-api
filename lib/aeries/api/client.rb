require 'aeries/api/client/contacts'
require 'aeries/api/client/schools'
require 'aeries/api/client/students'
require 'aeries/api/client/student_groups'

module Aeries
  module Api
    class Client
      include HTTParty
      include Aeries::Api::Client::Contacts
      include Aeries::Api::Client::Schools
      include Aeries::Api::Client::Students
      include Aeries::Api::Client::StudentGroups

      format :json

      def initialize(aeries_cert: nil, base_uri: nil)
        aeries_cert ||= ENV['AERIES_CERT']
        base_uri ||= ENV['AERIES_BASE_URI']

        self.class.default_options.merge!(headers: { 'AERIES-CERT': aeries_cert }, base_uri: base_uri)
      end
    end
  end
end
