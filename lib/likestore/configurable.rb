require 'forwardable'
require 'likestore/error/configuration_error'

module Likestore
  module Configurable
    extend Forwardable
    attr_writer :store_id, :key
    def_delegator :options, :hash

    class << self
      def keys
        @keys ||= [
          :store_id,
          :key
        ]
      end
    end

    def configure
      yield self
      validate_credential_type!
      self
    end

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
