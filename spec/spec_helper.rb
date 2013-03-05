require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start

require 'likestore'
require 'webmock/rspec'
require 'pry'
# WebMock.disable_net_connect!(:allow => 'coveralls.io')

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def a_get(path)
  a_request(:get, Likestore::Default::ENDPOINT + path + client_auth)
end

def stub_get(path)
  stub_request(:get, Likestore::Default::ENDPOINT + path + client_auth)
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

def client_options
  {store_id: 'abc', key: 'abc1'}
end

def  client_auth
  "?idLoja=#{client_options[:store_id]}&chave=#{client_options[:key]}"
end

