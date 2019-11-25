require 'aeries/api/client/schools'

module Aeries
  module Api
    class Client
      include HTTParty
      include Aeries::Api::Client::Schools

      base_uri ENV['AERIES_BASE_URI']
      format :json

      def initialize(aeries_cert = nil)
        aeries_cert ||= ENV['AERIES_CERT']
        self.class.default_options.merge!(headers: { 'AERIES-CERT': aeries_cert })
      end
    end
  end
end