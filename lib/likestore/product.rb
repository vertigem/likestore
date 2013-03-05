require 'likestore/identity'

module Likestore
  class Product < Likestore::Identity
    def description
      @attrs[:descricao]
    end
    def title
      @attrs[:nome]
    end
    def sku
      @attrs[:sku]
    end
    def weigth
      @attrs[:peso]
    end
  end
end
