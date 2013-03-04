require 'spec_helper'

describe Likestore do
  describe ".configure" do
    it "sets the keys" do
      Likestore.configure do |config|
        config.store_id = "a"
        config.key = "b"
      end
      expect(Likestore.instance_variable_get(:"@store_id")).to eq "a"
      expect(Likestore.instance_variable_get(:"@key")).to eq "b"
    end

    context "when no credentials are provided" do
      it "raises an exception" do
        expect {
          Likestore.configure do |config|
          config.store_id = nil
          config.key = nil
          end
        }.to raise_exception(Likestore::Error::ConfigurationError)
      end
    end
  end
end
