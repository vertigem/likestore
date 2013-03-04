require "likestore/version"
require 'likestore/configurable'
require 'likestore/client'

module Likestore
  class << self
    include Likestore::Configurable

    # Delegate to a Likestore::Client
    #
    # @return [Likestore::Client]
    def client
      @client = Likestore::Client.new() #unless defined?(@client) && @client.hash == options.hash
      @client
    end

    def respond_to_missing?(method_name, include_private=false); client.respond_to?(method_name, include_private); end


    private

    def method_missing(method_name, *args, &block)
      return super unless client.respond_to?(method_name)
      client.send(method_name, *args, &block)
    end

  end
end
