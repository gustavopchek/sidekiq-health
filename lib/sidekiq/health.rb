require 'sidekiq/health/railtie' if defined?(Rails::Railtie)
require 'sidekiq/health/config'

module Sidekiq
  module Health
    LIBRARY_PATH = File.join(File.dirname(__FILE__), 'health')
    GEM_PATH = File.dirname(__FILE__)

    %w{
      queue_names
      queue_status
      version
    }.each {|lib| require File.join(LIBRARY_PATH, lib) }

    class << self
      attr_reader :config
  
      def configure
        @config = Sidekiq::Health::Config.new.tap { |h| yield(h) }
      end
    end
  end
end

