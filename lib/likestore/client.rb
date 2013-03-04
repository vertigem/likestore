require 'likestore/configurable'

module Likestore
  class Client
    include Likestore::Configurable

    # Initializes a new Client object
    #
    # @param options [Hash]
    # @return [Twitter::Client]
    def initialize(options={})
      Likestore::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || Likestore.instance_variable_get(:"@#{key}"))
      end
    end
  end
end
