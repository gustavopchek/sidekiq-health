require 'hashie'

module Sidekiq
  module Health
    class Config < Hashie::Mash
      DEFAULTS = {
        maximum_healthy_queue_size: 100,
        maximum_healthy_dead_set_last_hour_size: 10
      }.freeze

      def resolved_maximum_healthy_queue_size
        self[:maximum_healthy_queue_size] || DEFAULTS[:maximum_healthy_queue_size]
      end

      def resolved_maximum_healthy_dead_set_last_hour_size
        self[:maximum_healthy_dead_set_last_hour_size] || DEFAULTS[:maximum_healthy_dead_set_last_hour_size]
      end
    end
  end
end
