require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/hash/keys'
require 'hashie'

require 'aeries-api/client/contacts'
require 'aeries-api/client/schools'
require 'aeries-api/client/staff'
require 'aeries-api/client/students'
require 'aeries-api/client/student_groups'
require 'aeries-api/client/student_pictures'
require 'aeries-api/client/student_programs'
require 'aeries-api/client/supplemental'
require 'aeries-api/error_handler'

module AeriesApi
  class Client
    include HTTParty
    include AeriesApi::Client::Contacts
    include AeriesApi::Client::Schools
    include AeriesApi::Client::Staff
    include AeriesApi::Client::Students
    include AeriesApi::Client::StudentGroups
    include AeriesApi::Client::StudentPictures
    include AeriesApi::Client::StudentPrograms
    include AeriesApi::Client::Supplemental

    format :json

    def initialize(aeries_cert: nil, base_uri: nil)
      @error_handler = AeriesApi::ErrorHandler.new

      aeries_cert ||= ENV['AERIES_CERT']
      base_uri ||= ENV['AERIES_BASE_URI']

      self.class.default_options.merge!(headers: { 'AERIES-CERT': aeries_cert, 'Content-Type': 'application/json' }, base_uri: base_uri)
    end

    private

    def camelize_keys(payload)
      payload.each do |p|
        p.deep_transform_keys! { |k| k.to_s.camelize }
      end
    end

    def mash_and_underscore_keys(parsed_response)
      return Hashie::Mash.new(parsed_response.deep_transform_keys! { |k| k.underscore }) if parsed_response.is_a?(Hash)
      parsed_response.each do |k, v|
        v.is_a?(Array) ? mash_and_underscore_keys(v) : k.deep_transform_keys! { |k| k.underscore }
      end
      parsed_response.map! { |r| Hashie::Mash.new(r) }
    end
  end
end
