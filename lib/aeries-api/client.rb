require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/hash/keys'
require 'hashie'

require 'aeries-api/client/contacts'
require 'aeries-api/client/schools'
require 'aeries-api/client/students'
require 'aeries-api/client/student_groups'
require 'aeries-api/client/student_pictures'
require 'aeries-api/client/student_programs'

module AeriesApi
  class Client
    include HTTParty
    include AeriesApi::Client::Contacts
    include AeriesApi::Client::Schools
    include AeriesApi::Client::Students
    include AeriesApi::Client::StudentGroups
    include AeriesApi::Client::StudentPictures
    include AeriesApi::Client::StudentPrograms

    format :json

    def initialize(aeries_cert: nil, base_uri: nil)
      aeries_cert ||= ENV['AERIES_CERT']
      base_uri ||= ENV['AERIES_BASE_URI']

      self.class.default_options.merge!(headers: { 'AERIES-CERT': aeries_cert }, base_uri: base_uri)
    end

    private

    def mash_and_underscore_keys(parsed_response)
      new_response = []
      parsed_response.each_with_object(new_response) do |r, a|
        r.deep_transform_keys! { |k| k.to_s.underscore }
        a << Hashie::Mash.new(r)
      end
      return new_response
    end

  end
end
