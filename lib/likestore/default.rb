require 'faraday'
require "likestore/version"
require 'likestore/response/parse_json'

module Likestore
  module Default
    ENDPOINT = 'http://likestore.com.br' unless defined? Likestore::Default::ENDPOINT
    CONNECTION_OPTIONS = {
      :headers => {
      :accept => 'application/json',
      :user_agent => "LikeStore Ruby Gem #{Likestore::VERSION}",
    },
    :request => {
      :open_timeout => 5,
      :timeout => 10,
    }
    } unless defined? Likestore::Default::CONNECTION_OPTIONS
    IDENTITY_MAP = false unless defined? Twitter::Default::IDENTITY_MAP
    MIDDLEWARE = Faraday::Builder.new do |builder|
      # Parse JSON response bodies using MultiJson
      builder.use Likestore::Response::ParseJson
      # Set Faraday's HTTP adapter
      builder.adapter Faraday.default_adapter
    end unless defined? Likestore::Default::MIDDLEWARE

    class << self
      # @return [Hash]
      def options
        Hash[Likestore::Configurable.keys.map{|key| [key, send(key)]}]
      end

      # @return [String]
      def store_id
        ENV['STORE_ID']
      end

      # @return [String]
      def key
        ENV['KEY']
      end

      def endpoint
        ENDPOINT
      end

      def connection_options
        CONNECTION_OPTIONS
      end

      def middleware
        MIDDLEWARE
      end

      def identity_map
        IDENTITY_MAP
      end
    end
  end
end
