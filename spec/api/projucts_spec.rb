require 'spec_helper'

describe Likestore::API::Products do
  before do
    @client = Likestore::Client.new(client_options)
  end

  describe "#products" do
    before do
      stub_get("/api/likestore/produtos").to_return(:body => fixture("produtos.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.products
      expect(a_get("/api/likestore/produtos")).to have_been_made
    end
  end
end
