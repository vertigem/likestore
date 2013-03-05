require 'spec_helper'

describe Likestore::Product do
  %w{   }.each do |attr|
  end

  describe "#description" do
    it "returns the description of a Product" do
      product = Likestore::Product.new(:descricao => 'Foo Bar')
      expect(product.send(:description)).to be_a String
      expect(product.send(:description)).to eq "Foo Bar"
    end
  end

  describe "#title" do
    it "returns the title of a Product" do
      product = Likestore::Product.new(:nome => 'Foo Bar')
      expect(product.send(:title)).to be_a String
      expect(product.send(:title)).to eq "Foo Bar"
    end
  end

  describe "#sku" do
    it "returns the sku of a Product" do
      product = Likestore::Product.new(:sku => 'Foo Bar')
      expect(product.send(:sku)).to be_a String
      expect(product.send(:sku)).to eq "Foo Bar"
    end
  end

  describe "#weigth" do
    it "returns the weigth of a Product" do
      product = Likestore::Product.new(:peso => 'Foo Bar')
      expect(product.send(:weigth)).to be_a String
      expect(product.send(:weigth)).to eq "Foo Bar"
    end
  end

end
