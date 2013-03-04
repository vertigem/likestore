require 'likestore/api/utils'

module Likestore
  module API
    module Products
      include Twitter::API::Utils

      def products(options = {})
         objects_from_response(Likestore::Product, :get, "/api/likestore/produtos", options)
      end
    end
  end
end
