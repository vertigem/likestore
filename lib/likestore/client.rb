require 'faraday'
require 'likestore/configurable'
require 'likestore/api/products'

module Likestore
  class Client
    include Likestore::Configurable
    include Likestore::API::Products

    def initialize(options={})
      puts options
      Likestore::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || Likestore.instance_variable_get(:"@#{key}"))
      end
    end

    # Perform an HTTP GET request
    def get(path, params={})
      request(:get, path, params)
    end

    private

    def request(method, path, params={})
      path = assing_auth_params(path)
      connection.send(method.to_sym, path, params) do |request|
        # request.headers[:authorization] = auth_header(method.to_sym, path, signature_params).to_s
      end.env
      #rescue Faraday::Error::ClientError
      #  raise Likestore::Error::ClientError
      #rescue MultiJson::DecodeError
      #  raise Likestore::Error::DecodeError
    end

    # Returns a Faraday::Connection object
    #
    # @return [Faraday::Connection]
    def connection
      @connection ||= Faraday.new(@endpoint, @connection_options.merge(:builder => @middleware))
    end

    def assing_auth_params(path)
      "#{path}?idLoja=#{@store_id}&chave=#{@key}"
    end
  end
end
