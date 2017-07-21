require 'webmock/rspec'
require "json"

RSpec.configure do |config|
  config.order = 'random'
  config.run_all_when_everything_filtered = false
end
