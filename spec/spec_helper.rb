$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sidekiq/health'
require 'pry'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    # disable the `should` syntax
    c.syntax = :expect
  end
end

Sidekiq::Health.configure do |config|
  config.maximum_healthy_queue_size = 30
  config.maximum_healthy_dead_set_last_hour_size = 15
  config.sidekiq_configuration_file_path = "config/sidekiq.rb"
end
