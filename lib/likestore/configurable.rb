require 'forwardable'
require 'likestore/error/configuration_error'

module Likestore
  module Configurable
    extend Forwardable
    attr_writer :store_id, :key
    attr_accessor :endpoint, :connection_options, :middleware, :identity_map
    def_delegator :options, :hash

    class << self
      def keys
        @keys ||= [
          :store_id,
          :key,
          :connection_options,
          :endpoint,
          :middleware,
          :identity_map
        ]
      end
    end

    def configure
      yield self
      validate_credential_type!
      self
    end

    def reset!
      Likestore::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", Likestore::Default.options[key])
      end
      self
    end
    alias setup reset!

    private
    # @return [Hash]
    def credentials
      {
        :store_id => @store_id,
        :key => @key,
      }
    end

    # @return [Hash]
    def options
      Hash[Likestore::Configurable.keys.map{|key| [key, instance_variable_get(:"@#{key}")]}]
    end


    def validate_credential_type!
      credentials.each do |credential, value|
        if value.nil?
          raise(Error::ConfigurationError, "Invalid #{credential} specified, the value can't be null")
        end
      end
    end
  end
end
