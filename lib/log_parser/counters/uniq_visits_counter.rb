# frozen_string_literal: true

module LogParser
  module Counters
    class UniqVisitsCounter
      def initialize(data)
        @data = data
      end

      def call
        uniq_visits_counter
      end

      private

      attr_reader :data

      def uniq_visits_counter
        uniq_visits = []

        data.group_by(&:url).map { |k, v| uniq_visits.append({ k => v.uniq.count }) }

        uniq_visits
      end
    end
  end
end
